import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../models/pixabay_model/pixabay_model.dart';
import '../../../utils/utils.dart';
import 'full_screen_image.dart';

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget({
    super.key,
    required this.pixabayModel,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });
  final PixabayModel pixabayModel;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final sizeDevice = Utils.of(context).sizeDevice;
    final widthDevice = sizeDevice.width;
    final size = widthDevice / (widthDevice ~/ 200) - 64;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Hero(
          tag: tag,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  PageRouteBuilder(
                    opaque: false,
                    barrierColor: Colors.white.withOpacity(0),
                    pageBuilder: (_, __, ___) => FullScreenImage(
                      isUseTransparentOnColor: false,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(.4),
                      child: getFullscreenImage(sizeDevice),
                    ),
                  ),
                ),
                child: Container(
                  color: Theme.of(context).cardColor,
                  child: CachedNetworkImage(
                    imageUrl: pixabayModel.previewURL,
                    width: size,
                    height: size + 32,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getBottomItem(pixabayModel.likes, FontAwesomeIcons.thumbsUp),
              getBottomItem(pixabayModel.views, FontAwesomeIcons.eye),
            ],
          ),
        ),
      ],
    );
  }

  Widget getFullscreenImage(Size sizeDevice) => Hero(
        tag: tag,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl: pixabayModel.webformatURL,
                progressIndicatorBuilder: (_, __, prog) => Center(
                  child: CircularProgressIndicator(
                    value: prog.progress,
                  ),
                ),
                fit: BoxFit.scaleDown,
                // height: pixabayModel.webformatHeight.toDouble(),
                // width: pixabayModel.webformatWidth.toDouble(),
              ),
            ),
          ],
        ),
      );

  Widget getBottomItem(int count, IconData icon) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(NumberFormat.compact().format(count)),
          const SizedBox(width: 8.0),
          FaIcon(icon),
        ],
      );
  Object get tag => ValueKey(pixabayModel.id);
}
