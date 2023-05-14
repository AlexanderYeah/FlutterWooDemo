import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../index.dart';

class CategoryListItemWidget extends StatelessWidget {
  // 分类的数据
  final CategoryModel category;
  // 选中id
  final int? selectId;
  // tap
  final Function(int categoryId)? onTap;

  const CategoryListItemWidget(
      {super.key, required this.category, this.selectId, this.onTap});

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 图
      ImageWidget.url(
        category.image?.src ?? "",
        width: 52.w,
        height: 52.w,
      ),
      // 文字
      TextWidget.body1(category.name ?? "-",
          size: 18.sp,
          color: selectId == category.id ? AppColors.onSecondary : null)
      //
    ]
        .toColumn(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly)
        .paddingVertical(AppSpace.button)
        .backgroundColor(selectId == category.id
            ? AppColors.onSurfaceVariant
            : Colors.transparent)
        .onTap(() {
      onTap?.call(category.id!);
    });
  }
}
