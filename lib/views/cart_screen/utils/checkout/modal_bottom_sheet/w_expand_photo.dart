import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/palette.dart';

class ExpandImageGrid extends StatelessWidget {
  const ExpandImageGrid({
    Key? key,
    required List<String> imageUrls,
  })  : _imageUrls = imageUrls,
        super(key: key);

  final List<String> _imageUrls;
  @override
  Widget build(BuildContext context) {
    const int _maxImages = 6;

    return Padding(
      padding: EdgeInsets.only(left: 40.w, right: 40.w),
      child: GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 56.w,
          crossAxisSpacing: 4.w,
        ),
        children: buildImagesGrid(_imageUrls, _maxImages),
      ),
    );
  }
}

List<Widget> buildImagesGrid(List<String> imageUrls, int maxImages) {
  int numImages = imageUrls.length;
  return List<Widget>.generate(
    min(numImages, maxImages),
    (index) {
      String imageUrl = imageUrls[index];

      // If its the last image
      if (index == maxImages - 1) {
        // Check how many more images are left
        int remaining = numImages - maxImages + 1;

        // If no more are remaining return a simple image widget
        if (remaining == 0) {
          // return Image.network(
          //   imageUrl,
          //   fit: BoxFit.cover,
          // );
          return Image.asset(
            imageUrl,
          );
        } else {
          // Create the facebook like effect for the last image with number of remaining  images
          return Stack(
            fit: StackFit.expand,
            children: [
              //Image.network(imageUrl, fit: BoxFit.cover),
              Image.asset(
                imageUrl,
              ),
              Positioned.fill(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.black54,
                  child: Text(
                    '+' + remaining.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.aliceBlueColor,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      } else {
        // return Image.network(
        //   imageUrl,
        //   fit: BoxFit.cover,
        // );
        return Image.asset(
          imageUrl,
        );
      }
    },
  );
}
