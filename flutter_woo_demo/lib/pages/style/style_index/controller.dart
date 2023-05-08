import 'package:dio/dio.dart';
import 'package:flutter_woo_demo/common/i18n/index.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart' hide Response;

class StyleIndexController extends GetxController {
  StyleIndexController();

  _initData() {
    update(["style_index"]);
  }

  void loadData() async {
    // Response rsp =
    //     await WPHttpService.to.get("/rank", params: {"responseId": "9779193"});
    // print(rsp);
  }

  void onTap() {
    var en = Translation.supportLocales[0];
    var zh = Translation.supportLocales[1];
    ConfigService.to.onLocaleUpdate(
        ConfigService.to.locale.toLanguageTag() == en.toLanguageTag()
            ? zh
            : en);
    update(['style_index']);
    loadData();
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
