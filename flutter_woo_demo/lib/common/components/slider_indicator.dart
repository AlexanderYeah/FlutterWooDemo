import 'package:flutter/material.dart';
import '../index.dart';

class SliderIndicatorWidget extends StatelessWidget {
  //个数
  final int length;
  // 当前位置
  final int currentIndex;
  // 颜色
  final Color myColor;
  // 是否是圆形
  final bool isCircle;
  // 对齐方式
  final MainAxisAlignment alignment;

  SliderIndicatorWidget(
      {Key? key,
      required this.length,
      required this.currentIndex,
      Color? color,
      this.isCircle = false,
      this.alignment = MainAxisAlignment.center})
      : myColor = color ?? AppColors.primary,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: List.generate(length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          // 圆形宽度 6 否则当前位置15 其他位置 8
          width: !isCircle
              ? currentIndex == index
                  ? 15
                  : 8
              : 6,
          height: !isCircle ? 4 : 6,
          decoration: BoxDecoration(
            // 圆角4
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            // 未选中的有个透明度
            color: currentIndex == index ? myColor : myColor.withOpacity(0.3),
          ),
        );
      }),
    );
  }
}
