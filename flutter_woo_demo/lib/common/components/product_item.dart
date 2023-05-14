import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import '../index.dart';

class ProductItemWidget extends StatelessWidget {
  // 点击事件
  final Function()? onTap;
  // 商品数据模型
  final ProductModel product;
  // 图片宽
  final double? imgWidth;
  final double? imgHeight;

  const ProductItemWidget(this.product,
      {super.key, this.onTap, this.imgWidth, this.imgHeight});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return _buildView(constraints);
      },
    );
  }

  Widget _buildView(BoxConstraints constraints) {
    var ws = <Widget>[
      // 图片
      if (product.images?.isNotEmpty == true)
        ImageWidget.url(
          product.images?.first.src ?? "",
          fit: BoxFit.cover,
          width: imgWidth ?? constraints.minWidth,
          height: imgHeight,
        ),

      // 标题和价格
      <Widget>[
        TextWidget.body2(product.name ?? ""),
        if (product.price != null)
          TextWidget.body2(
            product.price ?? "",
            weight: FontWeight.bold,
          )
      ]
          .toColumn(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start)
          .paddingHorizontal(5)
          .expanded(),
    ];

    return ws
        .toColumn(
            // 垂直方向首尾没有空隙的子控件间隔相同的分布
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start)
        .card(blurRadius: 5)
        .padding(all: 5)
        .onTap(() {
      if (onTap != null) {
        onTap?.call();
      } else {
        // 没有传入回调 就直接跳转到商品详情页面
        Get.toNamed(RouteNames.goodsProductDetails,
            arguments: {"id": product.id});
      }
    });
  }
}
