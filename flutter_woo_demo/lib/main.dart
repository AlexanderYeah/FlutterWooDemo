import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/style/index.dart';
import 'package:flutter_woo_demo/global.dart';
import 'package:get/get.dart';
import 'common/i18n/index.dart';
import 'common/index.dart';

// 保证service 正常的初始化
Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      // 主题设置
      theme: ConfigService.to.isDarkMode ? AppTheme.dark : AppTheme.light,
      initialRoute: "/style_index",
      getPages: RoutePages.list,
      navigatorObservers: [RoutePages.observer],
      // 语言设置
      translations: Translation(), //词典,
      fallbackLocale: Translation.fallbackLocale, //默认语言
      locale: ConfigService.to.locale, // 当前语言种类
      supportedLocales: Translation.supportLocales, // 支持的语言种类
      localizationsDelegates: Translation.localizationsDelegates, // 代理
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Text("data"));
  }
}
