import 'package:flutter/material.dart';
import '../index.dart';

class PlaceholdWidget extends StatelessWidget {
  // 资源图片路径
  final String? assetImagePath;

  const PlaceholdWidget({super.key, this.assetImagePath});
  @override
  Widget build(BuildContext context) {
    return Image.asset(assetImagePath ?? AssetsImages.homePlaceholderPng)
        .paddingHorizontal(AppSpace.page)
        .center();
  }
}
