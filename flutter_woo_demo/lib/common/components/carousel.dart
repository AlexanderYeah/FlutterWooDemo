import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../index.dart';

class CarouselWidget extends StatelessWidget {
  // 切换页码
  final Function(int, CarouselPageChangedReason)? onPageChanged;
  // 点击
  final Function(int, KeyValueModel)? onTap;
  // 数据列表
  final List<KeyValueModel> items;
  // 当前选中
  final int? currentIndex;
  // 高度
  final double? height;
  // 指示器颜色
  final Color? indicatorColor;
  // 指示器是否是圆形
  final bool? indicatorCircle;
  // 指示器对齐的方式
  final MainAxisAlignment? indicatorAlignment;
  // 指示器位置
  final double? indicatorLeft, indicatorRight, indicatorBottom;
  Widget _buildView() {
    List<Widget> ws = [
      // 滚动组件
      CarouselSlider.builder(
          itemCount: items.length,
          itemBuilder: (context, index, realIndex) {
            return ImageWidget.url(
              items[index].value,
              fit: BoxFit.fill,
            ).onTap(() {
              if (onTap != null) {
                onTap!(index, items[index]);
              }
            });
          },
          options: CarouselOptions(
              height: height,
              // 填充比例
              viewportFraction: 1,
              // 图像比例
              aspectRatio: 3.2 / 1,
              // 确定当前页面是否应该大于侧面图像，在旋转木马中营造一种深度感
              enlargeCenterPage: false,
              // 循环
              enableInfiniteScroll: true,
              // 自动播放
              autoPlay: true,
              // 回调也切换时间
              onPageChanged: onPageChanged)),

      SliderIndicatorWidget(
        length: items.length,
        currentIndex: currentIndex ?? 0,
        color: indicatorColor ?? AppColors.background,
        isCircle: indicatorCircle ?? true,
        alignment: indicatorAlignment ?? MainAxisAlignment.center,
      ).positioned(
          left: indicatorLeft ?? 20,
          right: indicatorRight ?? 20,
          bottom: indicatorBottom ?? 20),
    ];
    return ws.toStack();
  }

  // 指示器
  const CarouselWidget(
      {super.key,
      this.onPageChanged,
      this.onTap,
      required this.items,
      this.currentIndex,
      this.height,
      this.indicatorColor,
      this.indicatorCircle,
      this.indicatorAlignment,
      this.indicatorLeft,
      this.indicatorRight,
      this.indicatorBottom});

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
