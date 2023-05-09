import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/index.dart';

class PageTitleWidget extends StatelessWidget {
  final String title;
  final String desc;
  const PageTitleWidget({super.key, required this.title, required this.desc});
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      TextWidget.title1(title),
      TextWidget.body2(desc),
    ]
        .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
        .padding(left: 10, top: 10, bottom: 10);
  }
}
