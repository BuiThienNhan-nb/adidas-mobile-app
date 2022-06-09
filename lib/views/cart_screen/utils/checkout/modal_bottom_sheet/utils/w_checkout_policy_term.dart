import 'package:flutter/material.dart';

import '../../../../../utils/widget/privacy_term_dialog.dart';
import '../../../../../utils/widget/span_text_widget.dart';

class CheckoutPolicyTerm extends StatelessWidget {
  const CheckoutPolicyTerm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void popUpTerm() => showDialog(
          context: context,
          builder: (context) => PrivacyTermDialog(mdFileName: "term.md"),
        );
    void popUpPrivacy() => showDialog(
          context: context,
          builder: (context) => PrivacyTermDialog(mdFileName: "privacy.md"),
        );
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("By clicking PLACE ORDER, I confirm: "),
          MyTextSpan(
            contentText1: "I have read, understood and accepted the ",
            linkText1: "Privacy Notice",
            contentText2: " and ",
            linkText2: "Terms and Conditions",
            onTap1: popUpPrivacy,
            onTap2: popUpTerm,
          ),
          MyTextSpan(
            contentText1:
                "I hereby consent to the use of my personal data for marketing and promotional purposes as well as its transfer, sharing, disclosure to third parties.",
            linkText1: "",
            contentText2: "",
            linkText2: "",
            onTap1: () {},
            onTap2: () {},
          ),
        ],
      ),
    );
  }
}
