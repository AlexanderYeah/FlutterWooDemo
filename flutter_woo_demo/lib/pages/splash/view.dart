import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Center(
        child: Column(
      children: [
        GetBuilder<SplashController>(
          id: "splash_title",
          builder: (controller) {
            return Center(
              child: Text(controller.title),
            );
          },
        ),
        ElevatedButton(
            onPressed: () {
              controller.onTap(DateTime.now().microsecondsSinceEpoch);
            },
            child: const Text("点击"))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      id: "splash",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("splash")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
