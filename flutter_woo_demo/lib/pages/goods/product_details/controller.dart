import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/api/index.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';

// GetSingleTickerProviderStateMixin 是 TickerProvider 的实现，
// 当需要使用 Animation controller 时，需要在控制器初始化时传递一个 vsync 参数，此时需要用到 TickerProvider

class ProductDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ProductDetailsController();

  // 接收的id
  int? productId = Get.arguments['id'] ?? 0;

  ProductModel? product;

  List<KeyValueModel> bannerItems = [];
  // banner 当前的位置
  int bannerCurrentIndex = 0;
  // tab 控制器
  late TabController tabController;
  // tab 控制器
  int tabIndex = 0;
  // 颜色列表
  List<KeyValueModel<AttributeModel>> colors = [];
  // 选中的颜色列表
  List<String> colorKeys = [];

  _initData() async {
    await _loadProduct();
    await _loadCache();
    tabController = TabController(length: 3, vsync: this);
    update(["product_details"]);
  }

  _loadCache() async {
    // 颜色列表
    var stringColor =
        Storage().getString(Constants.storageProductsAttributesColors);
    colors = stringColor != ""
        ? jsonDecode(stringColor).map<KeyValueModel<AttributeModel>>((item) {
            var attr = AttributeModel.fromJson(item);
            return KeyValueModel(key: "${attr.name}", value: attr);
          }).toList()
        : [];
  }

  _loadProduct() async {
    product = await ProductApi.productDetail(productId);

    if (product?.images != null) {
      bannerItems = product!.images!.map<KeyValueModel>((e) {
        return KeyValueModel(key: "${e.id}", value: e.src ?? "");
      }).toList();
    }
  }

  void onTabBarTap(int index) {
    tabIndex = index;
    tabController.animateTo(index);
    update(["product_tab"]);
  }

  void onChangeBanner(int index, _reason) {
    bannerCurrentIndex = index;
    update(["product_banner"]); // 手动刷新
  }

  void onGalleryTap(int index, KeyValueModel item) {
    Get.to(GalleryWidget(
        initialIndex: index,
        items: bannerItems.map<String>((e) => e.value).toList()));
  }

  void onColorTap(List<String> keys) {
    colorKeys = keys;
    update(["product_colors"]);
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
    tabController.dispose();
  }
}
