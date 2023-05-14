import 'package:flutter_woo_demo/common/api/index.dart';
import 'package:flutter_woo_demo/common/model/index.dart';
import 'package:flutter_woo_demo/common/model/request/product.dart';
import 'package:flutter_woo_demo/common/services/index.dart';
import 'package:flutter_woo_demo/common/services/user.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  // 轮播图数据
  int bannerCurrentIndex = 0;
  // banner 数据
  List<KeyValueModel> bannerItems = [];
  // 分类导航数据<CategoryModel>
  List catogoryItems = [];
  // 推荐商品列表数据
  List<ProductModel> flashShellProductList = [];
  // 最新商品列表数据
  List<ProductModel> newProductProductList = [];

  // 分类点击事件
  void onCategoryTap(int categoryId) {
    print(categoryId);
  }

  // banner切换事件
  void onChangeBanner(int index, reason) {
    bannerCurrentIndex = index;
    update(["home_banner"]);
  }

  _initData() async {
    bannerItems = await SystemApi.banners();
    catogoryItems = await ProductApi.catogroies();

    flashShellProductList =
        await ProductApi.products(ProductsReq(featured: true));
    print(flashShellProductList.length);
    // newProductProductList = await ProductApi.products(ProductsReq());
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
