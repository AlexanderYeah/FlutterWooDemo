import 'dart:convert';

import 'package:flutter_woo_demo/common/api/index.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  CategoryController();

  int? categoryId = Get.arguments["id"];
  List<CategoryModel> categoryItems = [];
  _initData() async {
    update(["category"]);
    //直接读取缓存
    var stringCategories =
        Storage().getString(Constants.storageProductsCategories);
    categoryItems = stringCategories != ""
        ? jsonDecode(stringCategories).map<CategoryModel>((item) {
            return CategoryModel.fromJson(item);
          }).toList()
        : [];
    // 如果本地缓存空
    if (categoryItems.isEmpty) {
      categoryItems = await ProductApi.catogroies(); // 获取分类数据
    }
    update(["left_nav"]);
  }

  void onCategoryTap(int id) async {
    categoryId = id;
    update(["left_nav"]);
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
