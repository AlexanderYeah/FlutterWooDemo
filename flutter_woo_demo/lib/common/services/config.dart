import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../i18n/index.dart';

//package_info_plus  获取当前应用的版本号/获取当前应用的名字/获取当前应用的开发者

// 配置服务
class ConfigService extends GetxService {
  //单例化的写法
  static ConfigService get to => Get.find();
  PackageInfo? _platform;
  String get version => _platform?.version ?? "-";

//PlatformDispatcher  这个类负责派发从平台过来的各种从平台配置到屏幕和窗口的创建或销毁的事件，里面定义了许多的native方法，负责flutter与平台底层的交互。
// PlatformDispatcher向上层暴露了核心调度程序API、输入事件回调、图形绘制API和其他此类核心服务。

  // 获取系统的地区
  Locale locale = PlatformDispatcher.instance.locale;
  //初始化
  Future<ConfigService> init() async {
    await getPlatform();
    return this;
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  // 初始化语言
  void initLocale() {
    var langCode = Storage().getString(Constants.storageLanguageCode);
    if (langCode.isEmpty) return;
    var index = Translation.supportLocales.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) return;
    locale = Translation.supportLocales[index];
  }

  // 更改语言
  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // 初始化语言设置
    initLocale();
  }
}
