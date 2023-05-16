import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class SearchIndexPage extends GetView<SearchIndexController> {
  const SearchIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Center(child: _buildList());
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

  Widget _buildList() {
    return ListView.separated(
        itemBuilder: (context, index) {
          TagModel model = controller.tagsList[index];
          return _buildListItem(model);
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: controller.tagsList.length);
  }

  Widget _buildListItem(TagModel item) {
    return ListTile(
      title: TextWidget.body1(item.name ?? ""),
      trailing: IconWidget.icon(
        Icons.north_west,
        color: AppColors.primary,
      ),
      onTap: () => controller.onListItemTap(item),
    );
  }
}
