import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class StylesPage extends GetView<StylesController> {
  const StylesPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("StylesPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StylesController>(
      init: StylesController(),
      id: "styles",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("styles")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
