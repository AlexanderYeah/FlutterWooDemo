import 'dart:convert';

import 'package:flutter_woo_demo/common/api/index.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoryController extends GetxController {
  CategoryController();

  int? categoryId = Get.arguments["id"];
  List<CategoryModel> categoryItems = [];

  List<ProductModel> items = [];
  // 刷新控制器
  RefreshController refreshController = RefreshController(initialRefresh: true);
  // 页码
  int _page = 1;
  // 页尺寸
  final int _limit = 20;

  Future<bool> _loadSearch(bool isRefresh) async {
    // 拉取数据
    var result = await ProductApi.products(ProductsReq(
        page: isRefresh ? 1 : _page,
        prePage: _limit,
        category: categoryId.toString()));
    if (isRefresh) {
      _page = 1;
      items.clear();
    }
    if (result.isNotEmpty) {
      _page++;
      items.addAll(result);
    }
    return result.isNotEmpty;
  }

  void onLoading() async {
    if (items.isNotEmpty) {
      try {
        var isEmpty = await _loadSearch(false);
        if (isEmpty) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      } catch (e) {
        refreshController.loadComplete();
      }
    }
    update(["product_list"]);
  }

  // onRefresh
  void onRefresh() async {
    try {
      await _loadSearch(true);
      refreshController.refreshCompleted();
    } catch (e) {
      refreshController.refreshFailed();
    }
    update(["product_list"]);
  }

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
    // 刷新右侧的数据
    refreshController.requestRefresh();
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

  @override
  void onClose() {
    super.onClose();
    refreshController.dispose();
  }
}
