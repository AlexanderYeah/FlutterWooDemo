import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/style/index.dart';
import 'package:flutter_woo_demo/global.dart';
import 'package:get/get.dart';
import 'common/i18n/index.dart';
import 'common/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      splitScreenMode: false, //支持分屏尺寸
      minTextAdapt: false, // 是否根据宽度/高度中的最小值适配文字
      builder: (context, child) {
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

          debugShowCheckedModeBanner: false,
          // 1倍的子宽
          builder: (context, child) {
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!);
          },
        );
      },
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
