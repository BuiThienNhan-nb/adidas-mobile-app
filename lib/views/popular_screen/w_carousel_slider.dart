import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../models/ad_banner.dart';
import '../utils/widget/stf_wrapper.dart';
import 'w_carousel_item.dart';

class ProductCarouselSlider extends StatelessWidget {
  const ProductCarouselSlider({
    Key? key,
    required List<AdBanner> adBanners,
    required Function(double?) callback,
  })  : _adBanners = adBanners,
        _callback = callback,
        super(key: key);

  final List<AdBanner> _adBanners;
  final Function(double?) _callback;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        scrollDirection: Axis.vertical,
        onScrolled: (val) => _callback(val),
        height: double.infinity,
        //height: widget.size.height,
        // enlargeCenterPage: true,
        viewportFraction: 1,
        // autoPlay: true,
        // autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: false,
        // onPageChanged: (index, reason) =>
        //     setState(() => activeIndex = index),
      ),
      itemCount: _adBanners.length,
      itemBuilder: (context, index, realIndex) => (_adBanners[index].image ==
              null)
          ? AdBannerCarouselItem(
              adBanner: _adBanners[index],
              wChild: BannerVideoPlayer(url: _adBanners[index].video!),
              index: index,
            )
          // ? const VideoPlay()
          : AdBannerCarouselItem(
              adBanner: _adBanners[index],
              index: index,
              // wChild: Image.asset(
              //   _adBanners[index].image!,
              //   fit: BoxFit.fitHeight,
              // ),
              wChild: CachedNetworkImage(
                imageUrl: _adBanners[index].image!,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

class BannerVideoPlayer extends StatelessWidget {
  const BannerVideoPlayer({Key? key, required String url})
      : _url = url,
        super(key: key);

  final String _url;

  @override
  Widget build(BuildContext context) {
    final VideoPlayerController _controller = VideoPlayerController.asset(_url)
      ..setLooping(true);
    return StatefulWrapper(
      onInit: () =>
          _controller.initialize().then((value) => _controller.play()),
      child: VideoPlayer(_controller),
    );
  }
}
