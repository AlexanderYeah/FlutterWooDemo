import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:flutter_woo_demo/pages/search/search_filter/widgets/filter_view.dart';
import 'package:get/get.dart';

import 'index.dart';

class SearchFilterPage extends GetView<SearchFilterController> {
  const SearchFilterPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return <Widget>[_buildFilterBar(), _buildListView()].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchFilterController>(
      init: SearchFilterController(),
      id: "search_filter",
      builder: (_) {
        return Scaffold(
          key: controller.scaffordKey,
          appBar: mainAppBarWidget(
            // 返回按钮
            leading: ButtonWidget.icon(
              IconWidget.icon(
                Icons.arrow_back,
                color: AppColors.primary,
              ),
              onTap: () => Get.back(),
            ),
            // 输入文字
            hintText: LocaleKeys.searchPlaceholder.tr,
            // 点击事件
            onTap: () => Get.back(),
          ),
          body: SafeArea(
            child: _buildView(),
          ),
          endDrawer: const Drawer(
            child: SafeArea(child: FilterView()),
          ),
        );
      },
    );
  }

  // 搜索过滤栏
  Widget _buildFilterBar() {
    return <Widget>[
      // 排序 Best Match
      DropdownWidget(
        items: controller.orderList,
        hintText: controller.orderSelected.value,
        onChanged: controller.onOrderTap,
      )
          .decorated(
            border: Border.all(
              color: AppColors.surfaceVariant,
              width: 1,
            ),
          )
          .height(40.h)
          .expanded(),

      // 筛选 Filter
      ButtonWidget.dropdown(
        LocaleKeys.searchFilter.tr,
        IconWidget.icon(
          Icons.expand_more,
          color: AppColors.primary,
        ),
        onTap: controller.onFilterOpenTap,
        textSize: 15,
        textColor: AppColors.secondary,
        textWeight: FontWeight.w400,
        borderColor: AppColors.surfaceVariant,
        height: 40.h,
      ).expanded(),
    ].toRow();
  }

  Widget _buildSearchBar() {
    return Text("搜索栏");
  }

  Widget _buildListView() {
    return Text("数据列表");
  }
}
