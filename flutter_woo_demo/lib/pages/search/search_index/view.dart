import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class SearchIndexPage extends GetView<SearchIndexController> {
  const SearchIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("SearchIndexPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchIndexController>(
      init: SearchIndexController(),
      id: "search_index",
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

  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: AppSpace.listItem,
      title: InputWidget.textBorder(
        controller: controller.searcgEditController,
        hintText: "You Can Try T-Shirt",
        onChanged: (val) {
          printInfo(info: val);
        },
      ).paddingRight(AppSpace.page),
    );
  }
}
