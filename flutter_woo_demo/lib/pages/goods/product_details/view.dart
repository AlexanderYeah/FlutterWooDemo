import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_demo/common/components/carousel.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  // 生成一个tag 通过 tag 属性 进行区分不同商品控制器 Controller
  final String tag = " ${Get.arguments['id'] ?? ''}${UniqueKey()}";
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _ProductDetailsViewGetX(tag);
  }
}

class _ProductDetailsViewGetX extends GetView<ProductDetailsController> {
  // 1 定义tag唯一的变量
  final String uniqueTag;
  // 2 接收传入的tag值

  const _ProductDetailsViewGetX(this.uniqueTag, {Key? key}) : super(key: key);

  // 3 重写GetView属性tag
  @override
  String? get tag => uniqueTag;

  // 主视图
  Widget _buildView() {
    return <Widget>[_buildBanner(), _buildTitle(), _buildTabview()].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      init: ProductDetailsController(),
      id: "product_details",
      tag: tag, // 设置tag 属性
      builder: (_) {
        return Scaffold(
          appBar: mainAppBarWidget(titleString: LocaleKeys.gDetailTitle.tr),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }

  // 滚动图
  Widget _buildBanner() {
    return GetBuilder<ProductDetailsController>(
      id: "product_banner",
      tag: tag,
      builder: (controller) {
        return CarouselWidget(
          items: controller.bannerItems,
          currentIndex: controller.bannerCurrentIndex,
          onPageChanged: controller.onChangeBanner,
          onTap: controller.onGalleryTap,
          height: 190.w,
          indicatorCircle: false,
          indicatorAlignment: MainAxisAlignment.start,
          indicatorColor: AppColors.highlight,
        );
      },
    ).backgroundColor(AppColors.surfaceVariant);
  }

  // 商品标题
  Widget _buildTitle() {
    return Text("222");
  }

  // Tabview 视图
  Widget _buildTabview() {
    return Text("333");
  }
}
