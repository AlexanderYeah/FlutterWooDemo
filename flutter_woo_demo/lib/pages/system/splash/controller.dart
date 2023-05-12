import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_woo_demo/common/routers/index.dart';
import 'package:flutter_woo_demo/common/services/index.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();
  _initData() {
    update(["splash"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }
  @override
  void onReady() {
    super.onReady();
    // 删除设备启动图
    FlutterNativeSplash.remove();
    _jumpToPage();
    _initData();
  }

  _jumpToPage() {
    // 如果已经打开过引导页 则不要再次打开
    if (ConfigService.to.isAlreadyOpen) {
      Get.offAllNamed(RouteNames.main);
    } else {
      Get.offAllNamed(RouteNames.systemWelcome);
    }
  }
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
