import 'package:get/get.dart';

class GoodsController extends GetxController {
  GoodsController();

  _initData() {
    update(["goods"]);
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
