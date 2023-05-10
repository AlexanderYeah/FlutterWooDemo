import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:pinput/pinput.dart';

class PinputWidget extends StatelessWidget {
  // 提交事件
  final Function(String?) onSubmit;
  // 焦点
  final FocusNode? focusNode;
  // 文本编辑器
  final TextEditingController? controller;
  // 验证函数
  final String? Function(String?)? validator;

  const PinputWidget(
      {super.key,
      required this.onSubmit,
      this.focusNode,
      this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    // 默认的样式
    final defaultPinTheme = PinTheme(
      width: 45,
      height: 45,
      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.surfaceVariant),
        borderRadius: BorderRadius.circular(5),
      ),
    );
    // 编辑
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primary),
      borderRadius: BorderRadius.circular(5),
    );
    // 完成
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColors.surfaceVariant,
      ),
    );
    // TODO: implement build
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      submittedPinTheme: submittedPinTheme,
      focusedPinTheme: focusedPinTheme,
      length: 6, //长度
      validator: validator,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true, //显示光标
      autofocus: true, // 自动焦点
      obscureText: false, // 密码显示
      keyboardAppearance: Brightness.light,
      controller: controller,
      onCompleted: onSubmit,
    );
  }
}
