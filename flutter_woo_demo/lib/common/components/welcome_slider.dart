import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeSliderWidget extends StatelessWidget {
  // 项目
  final List<WelcomeModel> items;
  // 页数发生变化
  final Function(int) onPageChanged;
  // 控制器
  final CarouselController? carouselController;

  const WelcomeSliderWidget(this.items,
      {super.key, required this.onPageChanged, this.carouselController});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        carouselController: carouselController,
        items: items.map((e) => sliderItem(e, context)).toList(),
        options: CarouselOptions(
          height: 500.w,
          viewportFraction: 1, // 充满
          enableInfiniteScroll: false, //无限循环
          enlargeCenterPage: false, // 动画 封面效果
          autoPlay: false, // 自动播放
          onPageChanged: (index, reason) {
            onPageChanged(index);
          },
        ));
  }

  Widget sliderItem(WelcomeModel item, BuildContext context) {
    return <Widget>[
      // 图片
      if (item.image != null) ImageWidget.asset(item.image!, fit: BoxFit.cover),
      if (item.title != null)
        TextWidget.title1(
          item.title ?? "",
          maxLines: 2,
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      // 描述
      if (item.desc != null)
        TextWidget.body1(
          item.desc ?? "",
          maxLines: 3,
          softWrap: true,
          textAlign: TextAlign.center,
        )
    ]
        .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .width(MediaQuery.of(context).size.width);
  }
}
