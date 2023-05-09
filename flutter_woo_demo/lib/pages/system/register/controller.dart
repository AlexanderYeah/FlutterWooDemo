import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterController();

  // 用户名
  TextEditingController usernameController =
      TextEditingController(text: "leonardo");
  // 邮件
  TextEditingController emailController =
      TextEditingController(text: "1023954998@qq.com");
  // 姓
  TextEditingController firstNameController =
      TextEditingController(text: "leonardo");
  //名
  TextEditingController lastnameController =
      TextEditingController(text: "fibonacci");
  // 密码
  TextEditingController passwordController =
      TextEditingController(text: "12345678");

  _initData() {
    update(["register"]);
  }

  // 注册
  void onSignUp() {
    print("signup");
  }

  // 登录
  void onLogin() {
    print("login");
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

  @override
  void onClose() {
    super.onClose();
    // 释放掉
    usernameController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastnameController.dispose();
    passwordController.dispose();
  }
}
