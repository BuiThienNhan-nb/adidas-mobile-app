import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/widget/webview_widget.dart';
import '../setting_app_bar.dart';
import 'imprint_info_widget.dart';

class ImprintScreen extends StatefulWidget {
  static const String id = "ImprintScreen";
  const ImprintScreen({Key? key}) : super(key: key);

  @override
  State<ImprintScreen> createState() => _ImprintScreenState();
}

class _ImprintScreenState extends State<ImprintScreen> {
  final String _webUrl = "https://www.adidas-group.com";
  bool _isWebView = false;
  void togglePage() => setState(() => _isWebView = !_isWebView);
  @override
  Widget build(BuildContext context) {
    Widget buildBody() => PageTransitionSwitcher(
          duration: const Duration(milliseconds: 400),
          reverse: !_isWebView,
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
              SharedAxisTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          ),
          child: _isWebView
              ? WebViewWidget(
                  webUrl: _webUrl,
                  onBack: () async {
                    togglePage();
                    return false;
                  },
                )
              : ImprintInfoPage(
                  onLinkTab: togglePage,
                  webUrl: _webUrl,
                ),
        );

    return Scaffold(
      appBar: const SettingAppBar(title: "IMPRINT"),
      body: buildBody(),
      // body: ImprintInfoPage(
      //   onLinkTab: togglePage,
      //   webUrl: _webUrl,
      // ),
    );
  }
}
