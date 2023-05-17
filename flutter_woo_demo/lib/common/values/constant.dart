class Constants {
  static const storageLanguageCode = 'language_code';
  // 服务器地址
  static const wpApiBaseUrl = 'https://wpapi.ducafecat.tech';
  // static const wpApiBaseUrl =
  //     'https://mockapi.eolink.com/GwXjH2Pcb2d5a8f8129d761e0215f79b289e468a67d2359';

  // 主题
  static const storageThemeCode = 'theme_code';
  // 首次打开
  static const storageAlreadyOpen = 'already_open';
  // 登录成功
  static const storageToken = 'token'; // 登录成功后 token
  // 用户资料缓存
  static const storageProfile = 'profile';
  // AES aesKey
  // 加密 key 32 位 aesIV 加密向量 16 位 具体的请联系后端工程师，保持一致可调通
  static const aesKey = 'aH5aH5bG0dC6aA3oN0cK4aU5jU6aK2lN';
  static const aesIV = 'hK6eB4aE1aF3gH5q';
  // 首页离线缓存
  static const storageHomeBanner = 'home_banner';
  static const storageHomeCategories = 'home_categories';
  static const storageHomeFlashSell = 'home_flash_sell';
  static const storageHomeNewSell = 'home_new_sell';

  static const storageProductsCategories = 'home_categories';
  // 颜色定义
  static const storageProductsAttributesColors = 'products_attributes_colors';
  // 尺寸定义
  static const storageProductsAttributesSizes = 'products_attributes_sizes';
  // 品牌
  static const storageProductsAttributesBrand = 'products_attributes_brand';
  // 性别
  static const storageProductsAttributesGender = 'products_attributes_gender';
  // 新旧
  static const storageProductsAttributesCondition =
      'products_attributes_condition';
}
