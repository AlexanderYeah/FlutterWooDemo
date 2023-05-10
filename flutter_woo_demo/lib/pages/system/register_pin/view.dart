import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_woo_demo/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class RegisterPinPage extends GetView<RegisterPinController> {
  const RegisterPinPage({Key? key}) : super(key: key);
  // 主视图
  Widget _buildView() {
    return <Widget>[
      // 标题
      PageTitleWidget(
              title: LocaleKeys.registerPinTitle.tr,
              desc: LocaleKeys.registerPinDesc.tr)
          .padding(horizontal: AppSpace.page, top: 30, bottom: 10),
      _buildForm()
    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterPinController>(
      init: RegisterPinController(),
      id: "register_pin",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("register_pin")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }

  Widget _buildForm() {
    // 输入框表单
    return Form(
            key: controller.formKey,
            child: <Widget>[
              TextWidget.title2(LocaleKeys.registerPinFormTip.tr)
                  .padding(bottom: 20.w)
                  .alignLeft(),
              // 输入框
              PinputWidget(
                controller: controller.pinController,
                validator: controller.pinValidator,
                onSubmit: (p0) {
                  controller.onPinSubmit(p0!);
                },
              ).paddingBottom(30.w),

              // 按钮
              ButtonWidget.primary(
                LocaleKeys.registerPinButton.tr,
                onTap: controller.onBtnSubmit,
              ).padding(bottom: 30.w),

              // 返回按钮
              ButtonWidget.text(
                LocaleKeys.commonBottomCancel.tr,
                onTap: controller.onBtnBack,
              ),
            ].toColumn())
        .paddingAll(AppSpace.card)
        .card()
        .padding(horizontal: AppSpace.page);
  }
}
