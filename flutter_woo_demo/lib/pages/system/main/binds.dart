import 'package:flutter_woo_demo/pages/cart/cart_index/index.dart';
import 'package:flutter_woo_demo/pages/goods/home/index.dart';
import 'package:flutter_woo_demo/pages/index.dart';
import 'package:get/get.dart';

/// 主界面依赖
class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CartIndexController>(() => CartIndexController());
    Get.lazyPut<MyIndexController>(() => MyIndexController());
    Get.lazyPut<MainController>(() => MainController());
  }
}
