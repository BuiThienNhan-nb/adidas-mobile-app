import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/models/ad_banner.dart';
import 'package:flutter_adidas_clone/models/product.dart';
import 'package:flutter_adidas_clone/views/popular_screen/w_carousel_slider.dart';
import 'package:flutter_adidas_clone/views/utils/widget/app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidable/hidable.dart';

class PopularProductScreen extends StatelessWidget {
  const PopularProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String content = "Loading...";
    final Product product = Product(
      image: 'assets/images/temp_sneaker.png',
      tag: "LOW IN STOCK",
      price: 5200000,
      name: "ULTRABOOST 21 x PAREY SHOES",
    );
    final AdBanner banner = AdBanner(
      id: 'id',
      tag: 'ORIGINALS',
      title: 'ADIZERO X ALLBIRDS 2.94 KG CO2e',
      image:
          'https://brand.assets.adidas.com/image/upload/f_auto,q_auto,fl_lossy/viVN/Images/running-ss22-4dfwd-x-parley-launch-hp-teaser-carousel-card-dual-2d-d_tcm337-820245.jpg',
      video: 'assets/videos/adizero_ads.mp4',
      product: product,
    );
    final List<AdBanner> adBanners = [banner, banner, banner, banner];

    return Scaffold(
      appBar: const MyAppBar(
        isPopularScreen: true,
        title: "DROPS",
      ),
      // body: Container(
      //   color: Colors.white,
      //   child: LoadingIndicator(content: _content),
      // ),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     // const Text("Một cái gì đó hay ho"),
      //     Expanded(
      //       child: ProductCarouselSlider(
      //         adBanners: adBanners,
      //         callback: (val) {},
      //       ),
      //     ),
      //   ],
      // ),
      body: ProductCarouselSlider(
        adBanners: adBanners,
        callback: (value) {},
      ),
    );
  }
}

class HidableAppBar extends StatelessWidget implements PreferredSize {
  const HidableAppBar(
      {Key? key, required Widget child, required ScrollController controller})
      : _child = child,
        _controller = controller,
        super(key: key);

  final Widget _child;
  final ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return Hidable(
      controller: _controller,
      child: _child,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);
}
