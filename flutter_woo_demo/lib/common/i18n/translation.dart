import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Translation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {'en': localeEn, 'zh': localeZh};
  // 当前系统的语言
  static Locale? get locale => Get.deviceLocale;
  // 默认语言
  static const fallbackLocale = Locale('en', 'US');

  //支持语言的列表
  static const supportLocales = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
  ];

  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
