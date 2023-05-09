import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_woo_demo/common/routers/index.dart';
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
    // 欢迎页
    Future.delayed(const Duration(seconds: 1), () {
      // 表示跳到下一个页面,会关闭除它之外的所有页面。
      Get.offAllNamed(RouteNames.systemWelcome);
    });
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
