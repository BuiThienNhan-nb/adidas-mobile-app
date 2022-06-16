import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';

// ignore: must_be_immutable
class MyNetworkImage extends StatelessWidget {
  MyNetworkImage({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.fill,
    this.size,
  }) : super(key: key);

  final String imageUrl;
  BoxFit fit = BoxFit.fill;
  Size? size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Container(
        color: AppColors.whiteColor,
        child: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: fit,
      height: size == null ? null : size!.height,
      width: size == null ? null : size!.width,
    );
  }
}
