import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'index.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // 标题
      PageTitleWidget(
              title: LocaleKeys.loginBackTitle.tr,
              desc: LocaleKeys.loginBackDesc.tr)
          .paddingTop(40.w)
          .alignLeft(),
      // Form
      _buildForm().card(),
    ].toColumn().padding(horizontal: AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: "login",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("login")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }

  Widget _buildForm() {
    return Form(
            child: <Widget>[
      // email
      TextFormWidget(
        controller: controller.nameController,
        labelText: LocaleKeys.loginBackFieldEmail.tr,
        validator: Validatorless.multiple([
          // 空白的时候显示的提示文字
          Validatorless.required(LocaleKeys.validatorRequired.tr),
          Validatorless.min(3, LocaleKeys.validatorMin.trParams({"size": "3"})),
          Validatorless.max(
              20, LocaleKeys.validatorMin.trParams({"size": "20"})),
        ]),
      ).paddingBottom(AppSpace.listRow),
      // password
      TextFormWidget(
        controller: controller.passwordController,
        labelText: LocaleKeys.loginBackFieldPassword.tr,
        isObscure: true,
        validator: Validatorless.multiple([
          // 空白的时候显示的提示文字
          Validatorless.required(LocaleKeys.validatorRequired.tr),
          Validators.password(
              6,
              18,
              LocaleKeys.validatorPassword.trParams(
                {"min": "6", "max": "18"},
              ))
        ]),
      ).paddingBottom(15.w),
      // forget password
      ButtonWidget.text(
        LocaleKeys.loginForgotPassword.tr,
        onTap: controller.onForgetPassword,
      ).alignRight(),
      // sign in
      ButtonWidget.primary(
        "Sign In",
        onTap: controller.onSignIn,
      ).paddingBottom(20.w),
      // Or
      TextWidget.title3(LocaleKeys.loginOrText.tr).paddingBottom(20.w),
      // 其他登录按钮
      <Widget>[
        ButtonWidget.iconTextOutlined(
          IconWidget.svg(AssetsSvgs.facebookSvg),
          "Facebook",
          width: 149.w,
          height: 44.w,
          borderColor: AppColors.surfaceVariant,
        ),
        ButtonWidget.iconTextOutlined(
          IconWidget.svg(AssetsSvgs.googleSvg),
          "Goole",
          width: 149.w,
          height: 44.w,
          borderColor: AppColors.surfaceVariant,
        )
      ]
          .toRow(mainAxisAlignment: MainAxisAlignment.spaceAround)
          .paddingBottom(30.w),
    ].toColumn())
        .padding(all: AppSpace.card);
  }
}
