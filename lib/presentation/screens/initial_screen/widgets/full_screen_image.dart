import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class FullScreenImage extends StatefulWidget {
  const FullScreenImage({
    super.key,
    this.backgroundColor = const Color.fromARGB(128, 255, 255, 255),
    this.minOpacity = 0,
    this.maxOpacity = .6,
    this.isTransparent = false,
    this.isUseTransparentOnColor = true,
    this.isBarrierDissmisible = true,
    required this.child,
  });

  final Color backgroundColor;
  final double minOpacity, maxOpacity;
  final bool isTransparent, isUseTransparentOnColor, isBarrierDissmisible;
  final Widget child;

  @override
  State<FullScreenImage> createState() => _FullScreenPageState();
}

class _FullScreenPageState extends State<FullScreenImage> {
  var initialPositionY = .0,
      currentPositionY = .0,
      positionYDelta = .0,
      opacity = 1.0,
      disposeLimit = 150.0,
      animationDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    opacity = widget.maxOpacity;
  }

  void _startVerticalDrag(DragStartDetails details) {
    setState(() {
      initialPositionY = details.globalPosition.dy;
    });
  }

  void _whileVerticalDrag(DragUpdateDetails details) {
    setState(() {
      currentPositionY = details.globalPosition.dy;
      positionYDelta = currentPositionY - initialPositionY;
      setOpacity();
    });
  }

  void setOpacity() {
    double opacityByPos = positionYDelta < 0
        ? widget.maxOpacity - ((positionYDelta / 1000) * -1)
        : widget.maxOpacity - (positionYDelta / 1000);

    if (opacityByPos > 1) {
      opacity = widget.maxOpacity;
    } else if (opacityByPos < 0) {
      opacity = widget.minOpacity;
    } else {
      opacity = opacityByPos;
    }

    if (positionYDelta > disposeLimit || positionYDelta < -disposeLimit) {
      opacity = 0.3;
    }
  }

  void _endVerticalDrag(DragEndDetails details) {
    if (positionYDelta > disposeLimit || positionYDelta < -disposeLimit) {
      Get.back();
    } else {
      setState(() {
        animationDuration = const Duration(milliseconds: 300);
        opacity = widget.maxOpacity;
        positionYDelta = 0;
      });

      Future.delayed(animationDuration).then((_) {
        setState(() {
          animationDuration = Duration.zero;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeDevice = Utils.of(context).sizeDevice;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: color,
        constraints: BoxConstraints.expand(
          height: sizeDevice.height,
        ),
        child: Stack(
          children: <Widget>[
            if (widget.isBarrierDissmisible)
              Positioned.fill(
                child: GestureDetector(
                  onTap: Get.back,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            AnimatedPositioned(
              duration: animationDuration,
              curve: Curves.fastOutSlowIn,
              top: 0 + positionYDelta,
              bottom: 0 - positionYDelta,
              left: 0,
              right: 0,
              child: GestureDetector(
                onVerticalDragStart: _startVerticalDrag,
                onVerticalDragUpdate: _whileVerticalDrag,
                onVerticalDragEnd: _endVerticalDrag,
                child: widget.child,
              ),
            ),
            // GestureDetector(
            //   onVerticalDragStart: _startVerticalDrag,
            //   onVerticalDragUpdate: _whileVerticalDrag,
            //   onVerticalDragEnd: _endVerticalDrag,
            //   child: Placeholder(child: widget.child),
            // ),
          ],
        ),
      ),
    );
  }

  Color get color {
    if (widget.isTransparent) return Colors.transparent;
    if (!widget.isUseTransparentOnColor) return widget.backgroundColor;
    return widget.backgroundColor.withOpacity(opacity);
  }
}
