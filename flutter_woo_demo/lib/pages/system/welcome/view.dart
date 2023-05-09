import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/components/welcome_slider.dart';
import 'package:flutter_woo_demo/common/index.dart';
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
    ]
        .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .paddingAll(AppSpace.page);
  }

  Widget _buildSlider() {
    return GetBuilder(
      id: "slider",
      init: WelcomeController(),
      builder: (controller) {
        return controller.items.length == 0
            ? const SizedBox()
            : WelcomeSliderWidget(
                controller.items,
                onPageChanged: (p0) {},
              );
      },
    );
  }
}
