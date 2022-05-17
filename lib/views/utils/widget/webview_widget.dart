import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'loading_indicator.dart';

class WebViewWidget extends StatefulWidget {
  const WebViewWidget({
    Key? key,
    required String webUrl,
    required Future<bool> Function()? onBack,
  })  : _webUrl = webUrl,
        _onBack = onBack,
        super(key: key);
  final String _webUrl;
  final Future<bool> Function()? _onBack;

  @override
  State<WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget._onBack,
      child: Stack(
        children: <Widget>[
          WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: widget._webUrl,
            onPageFinished: (finished) => setState(() => _isLoading = false),
          ),
          _isLoading ? LoadingIndicator(content: "Loading...") : Stack(),
        ],
      ),
    );
  }
}
