import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';
import '../index.dart';

// 商品规格
class TabProductView extends GetView<ProductDetailsController> {
  final String uniqueTag;
  const TabProductView({Key? key, required this.uniqueTag}) : super(key: key);
  @override
  String? get tag => uniqueTag;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return <Widget>[
      _buildTitle("Color"),
      GetBuilder<ProductDetailsController>(
        id: "product_colors",
        tag: tag,
        builder: (controller) {
          return ColorsListWidget(
            itemList: controller.colors,
            keys: controller.colorKeys,
            size: 33.w,
            onTap: controller.onColorTap,
          ).paddingBottom(AppSpace.listRow * 2);
        },
      ),
    ]
        .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
        .paddingVertical(AppSpace.page);
  }

  // 标题
  _buildTitle(String title) {
    return TextWidget.body1(title).paddingBottom(AppSpace.listRow);
  }
}
