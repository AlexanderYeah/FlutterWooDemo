import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class GoodsPage extends GetView<GoodsController> {
  const GoodsPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("GoodsPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GoodsController>(
      init: GoodsController(),
      id: "goods",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("goods")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
