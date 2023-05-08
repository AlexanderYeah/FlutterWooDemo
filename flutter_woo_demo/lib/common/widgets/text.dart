import 'package:flutter/material.dart';

// 文字组件
class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final int? maxLines;
  final bool? softWrap;
  // 溢出
  final TextOverflow? overflow;
  // 对齐方式
  final TextAlign? textAlign;

  const TextWidget(
      {Key? key,
      required this.text,
      this.style,
      this.color,
      this.size,
      this.weight,
      this.maxLines = 1,
      this.softWrap = false,
      this.overflow = TextOverflow.clip,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text == "") {
      return const SizedBox();
    }
    return Text(
      text,
      style:
          style?.copyWith(color: color, fontSize: size, fontWeight: weight) ??
              TextStyle(
                color: color,
                fontSize: size,
                fontWeight: weight,
              ),
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      textAlign: textAlign,
    );
  }
}
