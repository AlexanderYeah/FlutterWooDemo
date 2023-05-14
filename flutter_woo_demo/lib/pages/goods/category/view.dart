import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return <Widget>[_buildLeftNav()].toRow();
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
}
