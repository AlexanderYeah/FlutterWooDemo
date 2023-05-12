import 'dart:convert';
import 'package:flutter_woo_demo/common/api/index.dart';

import '../index.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  // 被obs修饰之后的值 是一个对象 改变值要改变value
  final _isLogin = false.obs;
  String token = "";
  final _profile = UserProfileModel().obs;
  // 是否登录
  bool get isLogin => _isLogin.value;
  // 用户profile
  UserProfileModel get profile => _profile.value;
  // 是否有登录令牌
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // 读token
    token = Storage().getString(Constants.storageToken);
    // 读profile
    var profileOffline = Storage().getString(Constants.storageProfile);
    if (profileOffline.isNotEmpty) {
      // _profile.value = UserProfileModel.fromJson(jsonDecode(profileOffline));
      _profile(UserProfileModel.fromJson(jsonDecode(profileOffline)));
    }
  }

  // 设置令牌
  Future<void> setToken(String value) async {
    await Storage().setString(Constants.storageToken, value);
    token = value;
  }

  // 获取用户的profile
  Future<void> getProfile() async {
    if (token.isEmpty) return;
    UserProfileModel result = await UserApi.profile();
    _profile(result);
    _isLogin.value = true;
    // 保存到本地
    Storage().setString(Constants.storageProfile, jsonEncode(profile));
  }

  // 设置用户的profile
  Future<void> setProfile(UserProfileModel profile) async {
    if (token.isNotEmpty) return;
    _isLogin.value = true;
    _profile(profile);
    Storage().setString(Constants.storageProfile, jsonEncode(profile));
  }

  // 注销
  Future<void> logout() async {
    await Storage().remove(Constants.storageToken);
    _profile(UserProfileModel());
    _isLogin.value = false;
    token = "";
  }

  // 检查是否登录
  Future<bool> checkIsLogin() async {
    if (_isLogin.value == false) {
      await Get.toNamed(RouteNames.systemLogin);
      return false;
    }
    return true;
  }
}
