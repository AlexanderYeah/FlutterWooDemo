import 'package:flutter_woo_demo/pages/login/index.dart';
import 'package:get/get.dart';

// Binding 类是一个将依赖注入进行分离，同时“绑定”到 状态管理器Controller 和 路由管理器中，
//简单说，就是把UI 中的 控制器实例化部分抽离出来了，抽离时需要实现 Bindings 类

// 路由信息
class RoutePages {
  static List<GetPage> list = [
    //
    GetPage(name: "/", page: () => const LoginPage(), binding: LoginBinding())
  ];
}
