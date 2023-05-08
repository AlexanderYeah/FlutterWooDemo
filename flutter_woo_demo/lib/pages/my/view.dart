import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class MyPage extends GetView<MyController> {
  const MyPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("MyPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
      init: MyController(),
      id: "my",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("my")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
