import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_woo_demo/common/api/index.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';

class SearchIndexController extends GetxController {
  SearchIndexController();

  final TextEditingController searcgEditController = TextEditingController();

  // 搜索关键词
  final searchKeyWord = "".obs;

  // 搜索tag数据
  List<TagModel> tagsList = [];

  _initData() {
    update(["search_index"]);
  }

  Future<bool> _loadSearch(String keyword) async {
    if (keyword.trim().isEmpty == true) {
      tagsList.clear();
      return tagsList.isEmpty;
    }
    // 拉取数据
    var res = await ProductApi.tags(TagsReq(search: keyword));
    tagsList.clear();
    if (res.isNotEmpty) {
      tagsList.addAll(res);
    }
    return tagsList.isEmpty;
  }

  // 搜索栏防抖动
  void searchDebounce() {
    // getx 内置防抖处理
    debounce(searchKeyWord, (value) async {
      if (kDebugMode) {
        print("debounce->" + value.toString());
      }
      // 拉取数据
      await _loadSearch(value as String);
      update(["search_index"]);
    },
        // 延迟500毫秒
        time: const Duration(milliseconds: 500));
    searcgEditController.addListener(() {
      searchKeyWord.value = searcgEditController.text;
    });
  }

  // 列表点击事件
  void onListItemTap(TagModel model) {
    Get.toNamed(RouteNames.searchSearchFilter, arguments: {"tagId": model.id});
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    // 注册防抖动
    searchDebounce();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    searcgEditController.dispose();
  }
}
