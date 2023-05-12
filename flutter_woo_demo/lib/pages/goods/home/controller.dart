import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  _initData() {
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
