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

  // 尺寸列表
  List<KeyValueModel<AttributeModel>> sizes = [];
  // 选中的尺寸列表
  List<String> sizeKeys = [];

  _initData() async {
    await _loadProduct();
    await _loadCache();
    tabController = TabController(length: 3, vsync: this);
    // 滚动监听 联动效果
    tabController.addListener(() {
      tabIndex = tabController.index;
      update(["product_tab"]);
    });

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
    // 尺寸列表
    var stringSizes =
        Storage().getString(Constants.storageProductsAttributesSizes);

    sizes = stringSizes != ""
        ? jsonDecode(stringSizes).map<KeyValueModel<AttributeModel>>((item) {
            var arrt = AttributeModel.fromJson(item);
            return KeyValueModel(key: "${arrt.name}", value: arrt);
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

    if (product?.attributes != null) {
      // 初始化颜色和尺寸

      // 颜色
      var colorAttr =
          product?.attributes?.where((element) => element.name == "Color");
      if (colorAttr?.isNotEmpty == true) {
        colorKeys = colorAttr?.first.options ?? [];
      }

      // 尺寸
      var sizeAttr =
          product?.attributes?.where((element) => element.name == "Size");
      if (sizeAttr?.isNotEmpty == true) {
        sizeKeys = sizeAttr?.first.options ?? [];
      }
    }
  }

  void onSizeTap(List<String> keys) async {
    sizeKeys = keys;
    update(["product_sizes"]);
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
