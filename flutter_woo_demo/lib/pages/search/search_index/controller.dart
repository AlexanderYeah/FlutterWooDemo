import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SearchIndexController extends GetxController {
  SearchIndexController();

  final TextEditingController searcgEditController = TextEditingController();

  // 搜索关键词
  final searchKeyWord = "".obs;

  _initData() {
    update(["search_index"]);
  }

  // 搜索栏防抖动
  void searchDebounce() {
    // getx 内置防抖处理
    debounce(searchKeyWord, (value) async {
      if (kDebugMode) {
        print("debounce->" + value.toString());
      }
      // 拉取数据
      update(["search_index"]);
    },
        // 延迟500毫秒
        time: const Duration(milliseconds: 500));
    searcgEditController.addListener(() {
      searchKeyWord.value = searcgEditController.text;
    });
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
