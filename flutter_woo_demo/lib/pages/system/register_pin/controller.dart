import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';

class RegisterPinController extends GetxController {
  RegisterPinController();

  // pin 文字输入控制器
  TextEditingController pinController = TextEditingController();
  // 表单key
  GlobalKey formKey = GlobalKey<FormState>();

  _initData() {
    update(["register_pin"]);
  }

  void onPinSubmit(String val) {
    // 验证码输入完毕的时候 回调这里
    print(val);
  }

  // 按钮提交
  void onBtnSubmit() {
    print("object");
    Loading.success("111");
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
