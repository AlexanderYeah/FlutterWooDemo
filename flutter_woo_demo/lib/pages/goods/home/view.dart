import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_demo/common/components/carousel.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  // 主视图
  Widget _buildView() {
    return CustomScrollView(
      slivers: <Widget>[
        // 轮播广告
        _buildBanner(),
        // 分类导航
        _buildCatogory(),

        // title
        controller.flashShellProductList.isNotEmpty
            ? BuildListTitle(
                title: LocaleKeys.gHomeFlashSell.tr,
                subTitle: "03.30.30",
                onTap: () => controller.onAllTap(true),
              ).sliverToBoxAdapter().sliverPaddingHorizontal(AppSpace.page)
            : const SliverToBoxAdapter(),

        // list
        _buildFlashShell(),
        // title
        Text(LocaleKeys.gHomeNewProduct.tr)
            .sliverToBoxAdapter()
            .sliverPaddingHorizontal(AppSpace.page),
        // list
        _buildNewShell(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      // 这个地方的控制器 直接去Get.find 就行了,之前添加依赖添加过了,不要再去实例化 否则会出现bug
      init: Get.find<HomeController>(),
      id: "home",
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }

  // Appbar
  AppBar _buildAppBar() {
    return AppBar(
      // 背景透明
      backgroundColor: Colors.transparent,
      // 取消阴影
      elevation: 0,
      // 标题栏左侧间距
      titleSpacing: AppSpace.listItem,
      // 搜索栏
      title: InputWidget.search(
        // 提示文字 多语言
        hintText: LocaleKeys.gHomeSearch.tr,
        // 点击事件
        onTap: controller.onTapAppBar,
        // 只读
        readOnly: true,
      ),
      // 右侧的按钮区域
      actions: [
        IconWidget.svg(
          AssetsSvgs.pNotificationsSvg,
          size: 20,
          isDot: true,
        ).unconstrained().padding(
            left: AppSpace.listItem,
            right: AppSpace.page) // 去掉约束 ，Appbar 会有个约束下来
      ],
    );
  }

  // 轮播广告
  Widget _buildBanner() {
    return GetBuilder(
      id: "home_banner",
      init: controller,
      builder: (_) {
        return CarouselWidget(
          items: controller.bannerItems,
          currentIndex: controller.bannerCurrentIndex,
          onPageChanged: controller.onChangeBanner,
          height: 190.w,
        );
      },
    )
        .clipRRect(all: AppSpace.button)
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page);
    // .clipRRect(all: AppSpace.button);
  }

  // 分类导航
  Widget _buildCatogory() {
    return <Widget>[
      for (var i = 0; i < controller.catogoryItems.length; i++)
        CategoryListItemWidget(category: controller.catogoryItems[i])
    ]
        .toListView(
          scrollDirection: Axis.horizontal,
        )
        .height(90.w)
        .paddingVertical(AppSpace.listRow)
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page);
  }

  // 分类New Shell
  Widget _buildNewShell() {
    return Container()
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page);
  }

  // 分类Flash Shell
  Widget _buildFlashShell() {
    return <Widget>[
      for (var i = 0; i < controller.flashShellProductList.length; i++)
        ProductItemWidget(
          controller.flashShellProductList[i],
          imgWidth: 117.w,
          imgHeight: 120.w,
        )
            .constrained(width: 120.w, height: 170.w)
            .paddingRight(AppSpace.listItem)
    ]
        .toListView(scrollDirection: Axis.horizontal)
        .height(170.w)
        .paddingBottom(AppSpace.listRow)
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page);
  }
}
