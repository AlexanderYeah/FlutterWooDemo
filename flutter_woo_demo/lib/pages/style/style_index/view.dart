import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/i18n/index.dart';
import 'package:flutter_woo_demo/common/widgets/button.dart';
import 'package:flutter_woo_demo/common/widgets/icon.dart';
import 'package:get/get.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'index.dart';

class StyleIndexPage extends GetView<StyleIndexController> {
  const StyleIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        ButtonWidget.primary(
          "主要的",
          width: 70,
          height: 40,
          onTap: () {},
        ),
        ListTile(
            leading: ImageWidget.url(
                "https://ducafecat.oss-cn-beijing.aliyuncs.com/wp-content/uploads/2022/02/90bb74497f090c48e1df1ec1ca31fb11-450x450.jpg"),
            onTap: () {
              controller.onTap();
              ConfigService.to.switchThemeModel();
            },
            title: TextWidget(text: "语言${ConfigService.to.locale}"))
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
