import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'common/index.dart';

class Global {
  static Future<void> init() async {
    // WidgetFlutterBinding用于与Flutter引擎进行交互
    // WidgetsFlutterBinding.ensureInitialized();
    //这个表示先就行原生端（ios android）插件注册，然后再处理后续操作，这样能保证代码运行正确。
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    // 实例化存储类
    await Storage().init();
    // 初始化
    Loading();
    // 依赖注入 实例化网络请求工具
    Get.put<WPHttpService>(WPHttpService());
    Get.put<ConfigService>(ConfigService());

    // Get.put 方式直接注入
  }
}

// Get 的依赖注入
// Get.put():不使用控制器实例也会被创建
// Get.lazyPut():懒加载方式创建实例，只有在使用时才创建
// Get.putAsync(): `Get.put()`的异步版版本
// Get.create(): 每次使用都会创建一个新的实例