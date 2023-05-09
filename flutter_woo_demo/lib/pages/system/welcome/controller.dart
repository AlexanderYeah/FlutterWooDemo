import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  WelcomeController();

  List<WelcomeModel> items = [];
  int currentIdx = 0;
  CarouselController carouselController = CarouselController();
  // 是否显示start
  bool isShowStart = false;

  _initData() {
    update(["welcome"]);
    items = [
      WelcomeModel(
        image: AssetsImages.welcome_1Png,
        title: LocaleKeys.welcomeOneTitle.tr,
        desc: LocaleKeys.welcomeOneDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_2Png,
        title: LocaleKeys.welcomeTwoTitle.tr,
        desc: LocaleKeys.welcomeTwoDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_3Png,
        title: LocaleKeys.welcomeThreeTitle.tr,
        desc: LocaleKeys.welcomeThreeDesc.tr,
      ),
    ];
  }

  void onPageChanged(int index) {
    currentIdx = index;
    isShowStart = currentIdx == 2;
    update(["slider", "bar"]);
  }

  // 跳转到main
  void onToMain() {
    Get.offAllNamed(RouteNames.main);
  }

  // 下一个
  void onNext() {
    carouselController.nextPage();
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }
  @override
  void onReady() {
    super.onReady();
    // 设置打开过引导页
    ConfigService().setAlreadyOpen();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
