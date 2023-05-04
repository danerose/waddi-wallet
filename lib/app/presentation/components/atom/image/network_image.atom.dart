import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:waddi_wallet_app/core/constants/colors.constants.dart';

class NetworkImageAtom extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const NetworkImageAtom({
    super.key,
    required this.url,
    this.width = 50,
    this.height = 50,
    this.fit = BoxFit.scaleDown,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    if (url == '') {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(100),
          color: ColorsConstants.grey.withOpacity(0.2),
        ),
        child: const Center(
          child: Icon(
            Icons.format_overline,
            color: ColorsConstants.grey,
          ),
        ),
      );
    } else {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
        ),
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (BuildContext context, dynamic imageProvider) {
              return Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: fit,
                  ),
                ),
              );
            },
            placeholder: (BuildContext context, String url) {
              return Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(100),
                  color: ColorsConstants.grey.withOpacity(0.2),
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            errorWidget: (BuildContext context, String url, dynamic error) {
              return Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(100),
                  color: ColorsConstants.grey.withOpacity(0.2),
                ),
                child: const Center(
                  child: Icon(
                    Icons.format_overline,
                    color: ColorsConstants.grey,
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
