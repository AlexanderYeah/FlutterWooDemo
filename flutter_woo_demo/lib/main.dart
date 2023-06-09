import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/style/index.dart';
import 'package:flutter_woo_demo/global.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'common/i18n/index.dart';
import 'common/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
        return RefreshConfiguration(
            headerBuilder: () => const ClassicHeader(), // 自定义刷新头部
            footerBuilder: () => const ClassicFooter(), // 自定义刷新尾部
            hideFooterWhenNotFull: true, // 当列表不满一页时,是否隐藏刷新尾部
            headerTriggerDistance: 80, // 触发刷新的距离
            maxOverScrollExtent: 100, // 最大的拖动距离
            footerTriggerDistance: 150, // 触发加
            child: GetMaterialApp(
              title: 'Flutter Demo',
              // 主题设置
              theme:
                  ConfigService.to.isDarkMode ? AppTheme.dark : AppTheme.light,
              initialRoute: RouteNames.systemSplash,
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
                child = EasyLoading.init()(context, child);
                return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child);
              },
            ));
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
