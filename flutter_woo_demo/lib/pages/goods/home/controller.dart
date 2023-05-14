import 'package:flutter_woo_demo/common/api/index.dart';
import 'package:flutter_woo_demo/common/model/index.dart';
import 'package:flutter_woo_demo/common/model/request/product.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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

  // 刷新控制器
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  // 页码
  int _page = 1;
  // 页尺寸
  final int _limit = 20;

  // 拉去数据
  Future<bool> _loadNewsSell(bool isRefresh) async {
    //拉取数据
    var result = await ProductApi.products(
        ProductsReq(prePage: _limit, page: isRefresh ? 1 : _page));
    // 下拉刷新
    if (isRefresh) {
      // 充值数据
      _page = 1;
      newProductProductList.clear();
    }
    // 有数据
    if (result.isNotEmpty == true) {
      // 页数+！
      _page++;
      // 添加数据
      newProductProductList.addAll(result);
    }
    // 是否空
    return result.isNotEmpty;
  }

  // 上拉加载商品
  void onLoading() async {
    if (newProductProductList.isNotEmpty) {
      try {
        var isEmpty = await _loadNewsSell(false);
        if (isEmpty) {
          // 设置无数据
          refreshController.loadNoData();
        } else {
          // 加载完成
          refreshController.loadComplete();
        }
      } catch (e) {
        // 加载失败
        refreshController.loadFailed();
      }
    } else {
      refreshController.loadNoData();
    }
    update(["home_news_sell"]);
  }

  // 下拉刷新
  void onRefresh() async {
    try {
      await _loadNewsSell(true);
      refreshController.refreshCompleted();
    } catch (e) {
      refreshController.refreshFailed();
    }
    update(["home_news_sell"]);
  }

  // 分类点击事件
  void onCategoryTap(int categoryId) {
    print(categoryId);
  }

  // banner切换事件
  void onChangeBanner(int index, reason) {
    bannerCurrentIndex = index;
    update(["home_banner"]);
  }

  // 全部的点击事件
  void onAllTap(bool featured) {}

  _initData() async {
    bannerItems = await SystemApi.banners();
    catogoryItems = await ProductApi.catogroies();

    flashShellProductList =
        await ProductApi.products(ProductsReq(featured: true));
    print(flashShellProductList.length);

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

  @override
  void onClose() {
    super.onClose();
    refreshController.dispose();
  }
}
