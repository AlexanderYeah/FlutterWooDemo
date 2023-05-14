import 'package:flutter_woo_demo/common/api/index.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductListController extends GetxController {
  ProductListController();

  List<ProductModel> items = [];

  // 是否是推荐商品
  final bool featured = Get.arguments['featured'] ?? false;
  // 刷新控制器
  RefreshController refreshController = RefreshController(initialRefresh: true);
  // page
  int _page = 1;
  // 页尺寸
  final int _limit = 20;

  // 拉取数据
  Future<bool> _loadSearch(bool isRefresh) async {
    var result = await ProductApi.products(
        ProductsReq(page: isRefresh ? 1 : _page, prePage: _limit));
    // 下拉刷新
    if (isRefresh) {
      _page = 1;
      items.clear();
    }
    // 有数据
    if (result.isNotEmpty) {
      // 页码+1
      _page++;
      // 添加数据
      items.addAll(result);
      // 测试需要 添加更多数据
      items.addAll(result);
      items.addAll(result);
      items.addAll(result);
    }
    return result.isEmpty;
  }

  // 上拉加载更多
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
        refreshController.loadNoData();
      }
    }
    update(["product_list"]);
  }

  // 下拉刷新
  void onRefresh() async {
    try {
      await _loadSearch(true);
      refreshController.refreshCompleted();
    } catch (error) {
      refreshController.refreshFailed();
    }
    update(["product_list"]);
  }

  _initData() async {
    items = await ProductApi.products(ProductsReq(featured: true));
    update(["product_list"]);
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
