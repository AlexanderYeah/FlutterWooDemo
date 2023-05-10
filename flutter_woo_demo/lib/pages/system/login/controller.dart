import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController();

  TextEditingController nameController =
      TextEditingController(text: "1023954998@qq.com");
  TextEditingController passwordController =
      TextEditingController(text: "123456789");

  _initData() {
    update(["login"]);
  }

  // forget password
  void onForgetPassword() {}

  void onSignIn() {}

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
  void onClose() {
    super.onClose();
    // 销毁
    nameController.dispose();
    passwordController.dispose();
  }
}
