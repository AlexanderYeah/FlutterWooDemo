import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:flutter_woo_demo/common/model/woo/review_model/review_model.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../index.dart';

/// 商品评论
class TabReviewsView extends GetView<ProductDetailsController> {
  final String uniqueTag;

  const TabReviewsView({Key? key, required this.uniqueTag}) : super(key: key);

  @override
  String? get tag => uniqueTag;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      id: "product_reviews",
      tag: uniqueTag,
      builder: (controller) {
        return SmartRefresher(
          controller: controller.refreshController,
          // 启用上拉加载
          enablePullUp: true,
          // 下拉刷新回调
          onRefresh: controller.onReviewsRefresh,
          // 上拉加载回调
          onLoading: controller.onReviewsLoading,
          // 底部加载更多
          footer: const SmartRefresherFooterWidget(),
          child: ListView.separated(
              itemBuilder: (context, index) {
                var item = controller.reviews[index];
                return _buildListItem(item);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: AppSpace.listRow * 2);
              },
              itemCount: controller.reviews.length),
        );
      },
    );
  }

  Widget _buildListItem(ReviewModel item) {
    return <Widget>[
      // 头像
      const ImageWidget.asset(
        AssetsImages.defaultPng,
        width: 55,
        height: 55,
      ).paddingRight(AppSpace.listItem),

      // 星星 名称 评论 图
      <Widget>[
        // 名称
        <Widget>[
          TextWidget.title3(item.reviewer ?? ""),
          TextWidget.body3((item.dateCreated ?? "").toString().split("T")[0]),
        ]
            .toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
            .paddingBottom(AppSpace.listRow),
        // 评论
        TextWidget.body1(
          item.review?.clearHtml ?? "",
        ).paddingBottom(AppSpace.listRow),
        // 图
        _buildReviewImages().paddingBottom(AppSpace.listRow),
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start).expanded(),
    ].toRow(crossAxisAlignment: CrossAxisAlignment.start);
  }

  Widget _buildReviewImages() {
    return <Widget>[
      for (var i = 0; i < controller.reviewImages.length; i++)
        ImageWidget.url(
          controller.reviewImages[i],
          width: 45.w,
          height: 45.w,
        ).paddingRight(AppSpace.listItem).onTap(() {
          controller.onReviewsGalleryTap(i);
        })
      // 图片
    ].toWrap();
  }
}
