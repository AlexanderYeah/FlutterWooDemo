import 'package:flutter/material.dart';
import '../index.dart';
import 'package:get/get.dart';

class TabDetailView extends GetView<ProductDetailsController> {
  final String uniqueTag;

  TabDetailView({Key? key, required this.uniqueTag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Text("商品详情");
  }
}
