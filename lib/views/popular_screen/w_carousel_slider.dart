import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/ad_banner.dart';
import 'package:flutter_adidas_clone/views/popular_screen/w_carousel_item.dart';
import 'package:flutter_adidas_clone/views/utils/widget/stf_wrapper.dart';
import 'package:video_player/video_player.dart';

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
        enlargeCenterPage: true,
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
      itemBuilder: (context, index, realIndex) =>
          (_adBanners[index].image == null)
              ? AdBannerCarouselItem(
                  adBanner: _adBanners[index],
                  wChild: BannerVideoPlayer(url: _adBanners[index].video!),
                )
              // ? const VideoPlay()
              : AdBannerCarouselItem(
                  adBanner: _adBanners[index],
                  wChild: Image.asset(
                    _adBanners[index].image!,
                    fit: BoxFit.fill,
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
