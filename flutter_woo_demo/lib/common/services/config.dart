import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

//package_info_plus  获取当前应用的版本号/获取当前应用的名字/获取当前应用的开发者

// 配置服务
class ConfigService extends GetxService {
  //单例化的写法
  static ConfigService get to => Get.find();
  PackageInfo? _platform;
  String get version => _platform?.version ?? "-";
  //初始化
  Future<ConfigService> init() async {
    await getPlatform();
    return this;
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }
}
