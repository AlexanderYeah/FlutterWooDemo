import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class ProductListPage extends GetView<ProductListController> {
  const ProductListPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.7,
          mainAxisSpacing: AppSpace.listRow,
          crossAxisSpacing: AppSpace.listItem),
      children: List.generate(controller.items.length, (index) {
        return ProductItemWidget(
          controller.items[index],
          // imgHeight: 117.w,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(
      init: ProductListController(),
      id: "product_list",
      builder: (_) {
        return Scaffold(
            appBar: mainAppBarWidget(
              titleString: controller.featured == true
                  ? LocaleKeys.gFlashSellTitle.tr
                  : LocaleKeys.gNewsTitle.tr,
            ),
            body: SmartRefresher(
              controller: controller.refreshController,
              enablePullUp: true,
              onRefresh: controller.onRefresh,
              onLoading: controller.onLoading,
              footer: const SmartRefresherFooterWidget(),
              child: _buildView(),
            )).paddingHorizontal(AppSpace.page);
      },
    );
  }
}
