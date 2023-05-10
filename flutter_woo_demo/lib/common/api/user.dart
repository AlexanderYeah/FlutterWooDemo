import '../index.dart';

class UserApi {
  // 注册
  static Future<bool> register(UserRegisterReq req) async {
    var res = await WPHttpService.to.post('/users/register', data: req);
    if (res.statusCode == 200) {
      return true;
    }
    return false;
  }
}
