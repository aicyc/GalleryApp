import 'package:flutter/widgets.dart';

import '../../../utils/utils.dart';

class ElasticGridView extends StatelessWidget {
  const ElasticGridView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.scrollController,
    this.margin = const EdgeInsets.all(12.0),
    this.shrinkWrap = false,
    this.primary,
    this.physics,
    this.crossAxisSpacing = 12.0,
    this.mainAxisSpacing = 12.0,
    this.childAspectRatio = .8,
  });

  final EdgeInsetsGeometry margin;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool? primary;
  final double childAspectRatio, crossAxisSpacing, mainAxisSpacing;

  @override
  Widget build(BuildContext context) {
    return buildAppsCards(context);
  }

  Widget buildAppsCards(BuildContext context) {
    final sizeDevice = Utils.of(context).sizeDevice;
    var crossAxisCount =
        (sizeDevice.width ~/ 200).clamp(1, 999);

    return Padding(
      padding: margin,
      child: GridView.builder(
        cacheExtent: 500,
        primary: primary,
        physics: physics,
        shrinkWrap: shrinkWrap,
        controller: scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
        ),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
