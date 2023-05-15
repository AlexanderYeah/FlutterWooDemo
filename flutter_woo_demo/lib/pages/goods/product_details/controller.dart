import 'package:flutter_woo_demo/common/api/index.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  ProductDetailsController();

  // 接收的id
  int? productId = Get.arguments['id'] ?? 0;

  ProductModel? product;

  List<KeyValueModel> bannerItems = [];
  // banner 当前的位置
  int bannerCurrentIndex = 0;

  _initData() async {
    await _loadProduct();
    update(["product_details"]);
  }

  _loadProduct() async {
    product = await ProductApi.productDetail(productId);
    print(product);
    if (product?.images != null) {
      bannerItems = product!.images!.map<KeyValueModel>((e) {
        return KeyValueModel(key: "${e.id}", value: e.src ?? "");
      }).toList();
    }
  }

  void onChangeBanner(int index, _reason) {
    bannerCurrentIndex = index;
    update(["product_banner"]); // 手动刷新
  }

  void onGalleryTap(int index, KeyValueModel item) {
    Get.to(GalleryWidget(
        initialIndex: index,
        items: bannerItems.map<String>((e) => e.value).toList()));
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
