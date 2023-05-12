import 'package:flutter_woo_demo/common/services/user.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController();

  _initData() async {
    // 获取用户的资料
    await UserService.to.getProfile();

    update(["main"]);
  }

  void onTap() {}

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
