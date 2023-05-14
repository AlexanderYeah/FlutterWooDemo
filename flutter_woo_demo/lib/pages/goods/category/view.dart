import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return <Widget>[_buildLeftNav(), _buildProductList().expanded()].toRow();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      init: CategoryController(),
      id: "category",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(titleString: LocaleKeys.gCategoryTitle.tr),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }

  // 左边栏的view
  Widget _buildLeftNav() {
    return GetBuilder<CategoryController>(
      id: "left_nav",
      builder: (controller) {
        return ListView.separated(
                itemBuilder: (context, index) {
                  var item = controller.categoryItems[index];
                  return CategoryListItemWidget(
                      category: item,
                      selectId: controller.categoryId,
                      onTap: controller.onCategoryTap);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: AppSpace.listRow.w,
                  );
                },
                itemCount: controller.categoryItems.length)
            .width(100.w)
            .decorated(color: AppColors.surfaceVariant)
            .clipRRect(
                topRight: AppRadius.card.w, bottomRight: AppRadius.card.w);
      },
    );
  }

  // 右边的商品
  Widget _buildProductList() {
    return GetBuilder<CategoryController>(
      id: "product_list",
      builder: (controller) {
        return SmartRefresher(
            enablePullUp: true, // 启用上拉加载
            onRefresh: controller.onRefresh, // 下拉刷新回调
            onLoading: controller.onLoading, // 上拉加载回调
            footer: const SmartRefresherFooterWidget(), // 底部加载更多
            controller: controller.refreshController,
            child: controller.items.isEmpty
                ? const PlaceholdWidget()
                : GridView.builder(
                    itemCount: controller.items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: AppSpace.listRow,
                        crossAxisSpacing: AppSpace.listRow,
                        childAspectRatio: 0.8),
                    itemBuilder: (context, index) {
                      return ProductItemWidget(
                        controller.items[index],
                        imgHeight: 117.w,
                      );
                    },
                  ).paddingHorizontal(AppSpace.listView));
      },
    );
  }
}
