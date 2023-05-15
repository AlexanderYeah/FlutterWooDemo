import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/index.dart';
import '../index.dart';
import 'package:get/get.dart';

class TabDetailView extends GetView<ProductDetailsController> {
  final String uniqueTag;

  TabDetailView({Key? key, required this.uniqueTag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<ProductDetailsController>(
      tag: uniqueTag,
      builder: (controller) {
        return <Widget>[
// 说明
          _buildTitle("Description"),
          _buildContent(controller.product?.description?.clearHtml),

          // sku
          _buildTitle("SKU"),
          _buildContent(controller.product?.sku ?? "-"),

          // price
          _buildTitle("Price"),
          _buildContent(controller.product?.price ?? "-"),

          // 市场价
          _buildTitle("Regular price"),
          _buildContent(controller.product?.regularPrice ?? "-"),

          // 重量
          _buildTitle("Weight"),
          _buildContent(controller.product?.weight ?? "-"),

          // 尺寸
          _buildTitle("dimensions"),
          _buildContent(
              "${controller.product?.dimensions?.length} x ${controller.product?.dimensions?.width} x ${controller.product?.dimensions?.height}"),
        ]
            .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
            .scrollable()
            .paddingVertical(AppSpace.page);
      },
    );
  }

  // 标题
  _buildTitle(String title) {
    return TextWidget.title3(title).paddingBottom(AppSpace.listRow);
  }

  // 内容
  _buildContent(String? title) {
    return TextWidget.title2(
      title ?? "-",
      softWrap: true,
      maxLines: 10,
    ).paddingBottom(AppSpace.listRow * 2);
  }
}
