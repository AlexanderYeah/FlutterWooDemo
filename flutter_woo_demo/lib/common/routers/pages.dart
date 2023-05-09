import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/routers/index.dart';
import 'package:flutter_woo_demo/pages/system/main/binds.dart';

import '../../pages/index.dart';
import 'package:get/get.dart';

class RoutePages {
  static final RouteObserver observer = RouteObservers();

  // 路由的堆栈历史信息
  static List<String> history = [];

  static List<GetPage> list = [
    // 首页
    GetPage(name: '/', page: () => const MainPage(), binding: MainBinding()),
    // splash
    GetPage(name: RouteNames.systemSplash, page: () => const SplashPage()),
    // welcome
    GetPage(name: RouteNames.systemWelcome, page: () => const WelcomePage()),
    // style index
    GetPage(name: '/style_index', page: () => const StyleIndexPage())
  ];
}
