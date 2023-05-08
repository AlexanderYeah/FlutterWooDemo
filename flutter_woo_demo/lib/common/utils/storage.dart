import 'package:shared_preferences/shared_preferences.dart';

// 工厂方法构造函数:如果一个构造函数不总是返回一个新对象，
// 则用foctory来定义这个构造函数。例如一个工厂构造函数，
// 可能从缓存中获取一个实例并返回，或者返回一个子类型的实例。
// 使用单例本身目的在于创建一个唯一的对象，避免该对象可能会出现多头使用，造成数据冲突，还一个好处-----减少内存消耗。

class Storage {
  static final Storage _instance = Storage._internal();
  factory Storage() => _instance;
  // 私有构造函数 初始化
  Storage._internal();

  late final SharedPreferences _prefs;
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  String getString(String key) {
    return _prefs.getString(key) ?? "";
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  List getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  //删除
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
}

// 一个私有构造函数，一个对外公开构造方法，初始化就只有调用对外的factory修饰的公开构造方法，
// 不管调用多少次，始终都返回的是那一个静态初始化好的变量


// 所以总结性的来说，就是factory是用来修饰公开构造方法名的
// （我尝试改个名字，发现不允许），然后他带有一个返回值；
// 它的意义就是让构造方法变成一个带有返回值的方法，
// 于是返回值就具有很大的操作空间；在某种程度上来讲，
// 这个修饰的方法已经不是构造方法了，
// 它就是一个带有构造方法证件的皮包方法（带返回值的），
// 且返回值类型也固定为该类类型（以及子类）实例；

// class SingleInstance {
//   static final SingleInstance _singleInstance = SingleInstance._internal();

//   static SingleInstance get singleton => _singleInstance;

//   SingleInstance._internal();
// }

//   void mian() {
//     var s1 = SingleInstance.singleton;
//     var s2 = SingleInstance.singleton;
//     //s1==s2也是成立的
//   }
