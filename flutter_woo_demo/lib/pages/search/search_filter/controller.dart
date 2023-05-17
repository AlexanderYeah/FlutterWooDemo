import 'package:flutter/material.dart';
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
