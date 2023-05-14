import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../index.dart';

class BuildListTitle extends StatelessWidget {
  // 标题
  final String title;
  // 次标题
  final String? subTitle;
  // 更多点击事件
  final Function()? onTap;

  const BuildListTitle(
      {super.key, required this.title, this.subTitle, this.onTap});
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 标题
      TextWidget.title1(title),
      // 子标题
      TextWidget.body2(
        subTitle ?? "",
        color: AppColors.primary,
      ).paddingLeft(AppSpace.listItem).expanded(),
      // ALL
      <Widget>[
        TextWidget.body1(LocaleKeys.gHomeMore.tr),
        IconWidget.icon(Icons.chevron_right)
      ].toRow(mainAxisSize: MainAxisSize.min).onTap(() {
        onTap?.call();
      })
    ].toRow();
  }
}
