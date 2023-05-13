import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/services/user.dart';
import 'package:get/get.dart';

import '../../../common/index.dart';

class MainController extends GetxController {
  MainController();

  final PageController pageController = PageController();
  // 当前的索引
  int currentIdx = 0;

  // 导航栏切换
  void onIndexChange(int index) {
    currentIdx = index;
    update(["navigation"]);
  }

  _initData() async {
    // 获取用户的资料
    await UserService.to.getProfile();
    // Get.toNamed(RouteNames.systemLogin);
    update(["main"]);
  }

  void onJumpToTap(int page) {
    pageController.jumpToPage(page);
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
