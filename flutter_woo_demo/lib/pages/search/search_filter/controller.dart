import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:flutter_woo_demo/common/model/index.dart';
import 'package:get/get.dart';

class SearchFilterController extends GetxController {
  SearchFilterController();

  final GlobalKey<ScaffoldState> scaffordKey = GlobalKey<ScaffoldState>();
  //
  List<KeyValueModel> orderList = [
    KeyValueModel(key: "rating", value: "Best Match"),
    KeyValueModel(key: "price_low", value: "Price (low to high)"),
    KeyValueModel(key: "price_high", value: "Price (high to low)"),
    KeyValueModel(key: "popularity", value: "Popularity"),
    KeyValueModel(key: "date", value: "New publish"),
    KeyValueModel(key: "title", value: "Product name"),
    KeyValueModel(key: "slug", value: "Slug name"),
  ];

  KeyValueModel orderSelected =
      KeyValueModel(key: "rating", value: "Best Match");

  // 价格范围
  final List<double> priceRange = [100, 1000];

  // 尺寸列表
  List<KeyValueModel<AttributeModel>> sizes = [];
  // 尺寸
  List<String> sizeKeys = [];

  // 颜色列表
  List<KeyValueModel<AttributeModel>> colors = [];
  // 选中颜色列表
  List<String> colorKeys = [];

  // 星级
  int starValue = -1;

  // 星级选中
  void onStarTap(int value) {
    starValue = value;
    update(["filter_stars"]);
  }

  // 价格拖动区间
  void onPriceRangeDragging(
      int handleIndex, dynamic lowerValue, dynamic upperValue) {
    priceRange[0] = lowerValue as double;
    priceRange[1] = upperValue as double;
    update(["filter_price_range"]);
  }

  // 尺寸选中
  void onSizeTap(List<String> keys) {
    sizeKeys = keys;
    update(["filter_sizes"]);
  }

  // 颜色选中
  void onColorTap(List<String> keys) {
    colorKeys = keys;
    update(["filter_colors"]);
  }

  void onOrderTap(KeyValueModel? val) {
    orderSelected = val!;
    update(["search_filter"]);
  }

  _initData() {
    update(["search_filter"]);
  }

  // 打开筛选
  void onFilterOpenTap() {
    // 打开筛选框
    scaffordKey.currentState?.openEndDrawer();
  }

  void onFilterCloseTap() {
    Get.back();
  }

  void onTap() {}

  // 读取缓存
  void _loadCache() async {
    // 尺寸列表

    String result =
        Storage().getString(Constants.storageProductsAttributesSizes);
    sizes = jsonDecode(result).map<KeyValueModel<AttributeModel>>((item) {
      var arrt = AttributeModel.fromJson(item);
      return KeyValueModel(key: "${arrt.name}", value: arrt);
    }).toList();

    // 颜色列表
    {
      String result =
          Storage().getString(Constants.storageProductsAttributesColors);
      colors = jsonDecode(result).map<KeyValueModel<AttributeModel>>((item) {
        var arrt = AttributeModel.fromJson(item);
        return KeyValueModel(key: "${arrt.name}", value: arrt);
      }).toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    _loadCache();
  }

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
