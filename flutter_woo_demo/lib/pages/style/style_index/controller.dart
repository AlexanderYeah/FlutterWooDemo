import 'package:flutter_woo_demo/common/i18n/index.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';

class StyleIndexController extends GetxController {
  StyleIndexController();

  _initData() {
    update(["style_index"]);
  }

  void onTap() {
    var en = Translation.supportLocales[0];
    var zh = Translation.supportLocales[1];
    ConfigService.to.onLocaleUpdate(
        ConfigService.to.locale.toLanguageTag() == en.toLanguageTag()
            ? zh
            : en);
    update(['style_index']);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
