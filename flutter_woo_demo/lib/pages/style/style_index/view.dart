import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/i18n/index.dart';
import 'package:get/get.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'index.dart';

class StyleIndexPage extends GetView<StyleIndexController> {
  const StyleIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        ListTile(
          onTap: () {
            controller.onTap();
            ConfigService.to.switchThemeModel();
          },
          title: Text("语言${ConfigService.to.locale}"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StyleIndexController>(
      init: StyleIndexController(),
      id: "style_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(LocaleKeys.addressAddress1.tr)),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
