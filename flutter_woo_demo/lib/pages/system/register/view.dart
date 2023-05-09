import 'package:flutter/material.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';
import 'index.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
            child: <Widget>[
      // 头部的标题
      PageTitleWidget(
              title: LocaleKeys.registerTitle.tr,
              desc: LocaleKeys.registerDesc.tr)
          .padding(top: 50, bottom: 10),
      // 表单区域
      _buildForm().card(),
    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start))
        .paddingHorizontal(AppSpace.page);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      id: "register",
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("register")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }

  // form
  Widget _buildForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // username
        TextFormWidget(
          autofocus: true,
          controller: controller.usernameController,
          labelText: LocaleKeys.registerFormName.tr,
        ),
        // email
        TextFormWidget(
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          controller: controller.emailController,
          labelText: LocaleKeys.registerFormEmail.tr,
        ),

        // first name
        TextFormWidget(
          autofocus: true,
          controller: controller.firstNameController,
          labelText: LocaleKeys.registerFormFirstName.tr,
        ),

        // last name
        TextFormWidget(
          autofocus: true,
          controller: controller.lastnameController,
          labelText: LocaleKeys.registerFormLastName.tr,
        ),
        // password
        TextFormWidget(
          controller: controller.passwordController,
          labelText: LocaleKeys.registerFormPassword.tr,
          isObscure: true,
        ).paddingBottom(50),

        // 注册按钮
        _buildSignUpBtn(),
        // 下面的提示文字
        _buildTips()
      ].toColumn().paddingAll(AppSpace.card),
    );
  }

  // 构建注册按钮
  Widget _buildSignUpBtn() {
    return ButtonWidget.primary(LocaleKeys.loginSignUp.tr, onTap: () {
      controller.onSignUp();
    }).paddingBottom(AppSpace.listRow);
  }

  // 构建提示文字
  Widget _buildTips() {
    return <Widget>[
      TextWidget.body1(LocaleKeys.registerHaveAccount.tr).padding(right: 2),
      // 登录文字
      ButtonWidget.text(
        LocaleKeys.loginSignIn.tr,
        textColor: AppColors.primary,
        onTap: () => controller.onLogin(),
      ),
    ].toRow(mainAxisAlignment: MainAxisAlignment.center);
  }
}
