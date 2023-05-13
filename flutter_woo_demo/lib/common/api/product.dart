import 'package:flutter_woo_demo/common/model/request/product.dart';

import '../index.dart';

class ProductApi {
  // 分类列表
  static Future<List<CategoryModel>> catogroies() async {
    var res = await WPHttpService.to.get(
      '/product/categories',
    );
    List<CategoryModel> categorys = [];
    for (var item in res.data) {
      categorys.add(CategoryModel.fromJson(item));
    }
    // 排序 menuOrder 小号在前
    categorys.sort(((a, b) => a.menuOrder!.compareTo(b.menuOrder as int)));
    return categorys;
  }

  // 商品列表
  static Future<List<ProductModel>> products(ProductsReq? req) async {
    var res = await WPHttpService.to.get("/products", params: req?.toJson());
    List<ProductModel> products = [];
    for (var item in res.data) {
      products.add(ProductModel.fromJson(item));
    }
    return products;
  }
}
