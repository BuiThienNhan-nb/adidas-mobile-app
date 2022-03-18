import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_adidas_clone/views/utils/widget/loading_indicator.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PrivacyTermDialog extends StatelessWidget {
  PrivacyTermDialog({
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
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: FutureBuilder(
        future: Future.delayed(const Duration(milliseconds: 300)).then((value) {
          return rootBundle.loadString('assets/docs/$mdFileName');
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Markdown(
              data: snapshot.data.toString(),
            );
          }
          return const Center(
            child: LoadingIndicator(content: "Loading..."),
          );
        },
      ),
    );
  }
}
