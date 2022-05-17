import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../../../utils/widget/loading_indicator.dart';

class PrivacyTermBodyWidget extends StatelessWidget {
  PrivacyTermBodyWidget({
    Key? key,
    this.radius = 8,
    required this.mdFileName,
  })  : assert(mdFileName.contains('.md'),
            'The file must contain the .md extension'),
        super(key: key);

  final double radius;
  final String mdFileName;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 300)).then((value) {
        return rootBundle.loadString('assets/docs/$mdFileName');
      }),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Markdown(
            data: snapshot.data.toString(),
          );
        }
        return Center(
          child: LoadingIndicator(content: "Loading..."),
        );
      },
    );
  }
}
