import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_demo/common/components/welcome_slider.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:flutter_woo_demo/common/widgets/button.dart';
import 'package:get/get.dart';

import 'index.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      id: "welcome",
      builder: (_) {
        return Scaffold(
          body: _buildView(),
        );
      },
    );
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // slider 切换
      _buildSlider(),
      //  控制栏
      _buildBar(),
    ]
        .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .paddingAll(AppSpace.page);
  }

  // 创建indicator
  Widget _buildBar() {
    return GetBuilder<WelcomeController>(
      id: "bar",
      init: WelcomeController(),
      builder: (controller) {
        return controller.isShowStart
            ? ButtonWidget.primary(
                LocaleKeys.welcomeStart.tr,
                onTap: () {
                  controller.onToMain();
                },
              ).tight(width: double.infinity, height: 50.h)
            : <Widget>[
                // 开始
                ButtonWidget.text(
                  LocaleKeys.welcomeSkip.tr,
                  onTap: () {
                    controller.onToMain();
                  },
                ),
                // 指示标
                SliderIndicatorWidget(
                    length: controller.items.length,
                    currentIndex: controller.currentIdx
                    // color: AppColors.primary,
                    ),
                // 下一页
                ButtonWidget.text(
                  LocaleKeys.welcomeNext.tr,
                  onTap: () {
                    controller.onNext();
                  },
                ),
              ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround);
      },
    );
  }

  // 创建轮播图
  Widget _buildSlider() {
    return GetBuilder<WelcomeController>(
      id: "slider",
      init: WelcomeController(),
      builder: (controller) {
        return controller.items.length == 0
            ? const SizedBox()
            : WelcomeSliderWidget(
                carouselController: controller.carouselController,
                controller.items,
                onPageChanged: (idx) {
                  controller.onPageChanged(idx);
                },
              );
      },
    );
  }
}
