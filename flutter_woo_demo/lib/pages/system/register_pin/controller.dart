import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/api/index.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';

class RegisterPinController extends GetxController {
  RegisterPinController();

  // pin 文字输入控制器
  TextEditingController pinController = TextEditingController();
  // 表单key
  GlobalKey formKey = GlobalKey<FormState>();

  // 接受传值
  UserRegisterReq? req = Get.arguments;

  _initData() {
    update(["register_pin"]);
  }

  void onPinSubmit(String val) {
    // 验证码输入完毕的时候 回调这里
    print(val);
  }

  // 按钮提交
  void onBtnSubmit() {
    // 注册
    _register();
  }

  // 发送注册请求
  Future<void> _register() async {
    try {
      Loading.show();
      bool isOk = await UserApi.register(req!);
      if (isOk) {
        Loading.success(
            LocaleKeys.commonMessageSuccess.trParams({"method": "Resgiter"}));
        Get.back(result: true);
      }
      // Loading.success(
      //     LocaleKeys.commonMessageSuccess.trParams({"method": "Resgiter"}));
      // Get.back(result: true);
    } finally {
      Loading.dismiss();
    }
  }

  // 按钮返回
  void onBtnBack() {
    Get.back();
  }

  String? pinValidator(val) {
    // 验证码为111111的时候为正确的验证码
    return val == "111111"
        ? null
        : LocaleKeys.commonMessageIncorrect.trParams({"method": "pin"});
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
    pinController.dispose();
  }
}
