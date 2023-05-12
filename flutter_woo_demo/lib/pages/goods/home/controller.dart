import 'package:flutter_woo_demo/common/api/index.dart';
import 'package:flutter_woo_demo/common/model/index.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  // 轮播图数据
  int bannerCurrentIndex = 0;
  // banner 数据
  List<KeyValueModel> bannerItems = [];
  // banner切换事件
  void onChangeBanner(int index, reason) {
    bannerCurrentIndex = index;
    update(["home_banner"]);
  }

  _initData() async {
    bannerItems = await SystemApi.banners();
    update(["home"]);
  }

  //  标题栏的点击
  void onTapAppBar() {}

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
