import 'package:flutter/widgets.dart';
import 'package:flutter_woo_demo/common/api/index.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:flutter_woo_demo/common/services/user.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController();
  // 1023954998@qq.com
  TextEditingController nameController = TextEditingController(text: "yskysk");
  TextEditingController passwordController =
      TextEditingController(text: "qwer1234");

  _initData() {
    update(["login"]);
  }

  // forget password
  void onForgetPassword() {}

  void onSignIn() {
    // 登录操作
    login();
  }

  Future<void> login() async {
    try {
      Loading.show();
      // 请求结果
      var password = EncryptUtil().aesEncode(passwordController.text);
      UserTokenModel res = await UserApi.login(
          UserLoginReq(username: nameController.text, password: password));
      // 本地保存
      await UserService.to.setToken(res.token!);
      print(res.token!);
      await UserService.to.getProfile();
      Loading.success();
      Get.back(result: true);
    } finally {
      Loading.dismiss();
    }
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
  void onClose() {
    super.onClose();
    // 销毁
    nameController.dispose();
    passwordController.dispose();
  }
}
