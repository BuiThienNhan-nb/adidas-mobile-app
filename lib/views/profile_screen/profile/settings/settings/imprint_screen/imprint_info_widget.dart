import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adidas_clone/configs/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImprintInfoPage extends StatelessWidget {
  const ImprintInfoPage({
    Key? key,
    required Function() onLinkTab,
    required String webUrl,
  })  : _onLinkTab = onLinkTab,
        _webUrl = webUrl,
        super(key: key);
  final Function() _onLinkTab;
  final String _webUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "XUẤT BẢN BỞI",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          const Text("Công ty TNHH adidas Việt Nam;"),
          const Text("Tầng 8, Deutsches Haus, 33, Lê Duẩn"),
          const Text("Phường Bến Nghé, Quận 1"),
          const Text("Thành phố Hồ Chí Minh, Việt Nam"),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: AppColor.kIconBackgroundColor,
              ),
              children: <TextSpan>[
                const TextSpan(
                    text: "Vui lòng truy cập trang web của tập đoàn adidas: "),
                TextSpan(
                  text: _webUrl,
                  style: TextStyle(
                    color: Colors.blue.shade500,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.2,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = _onLinkTab,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
