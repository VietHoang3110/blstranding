
import 'package:flutter/material.dart';

import '../../src/preferences_key.dart';
import '../../src/src_index.dart';

class WidgetAccountType extends StatelessWidget {
  const WidgetAccountType({
    Key? key,
    this.padding,
    this.accountStyles = AccountStyles.customer,
  }) : super(key: key);
  final AccountStyles accountStyles;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    Widget widget = Container(
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.green,
      ),
      child: Text(
        "Khách hàng",
        style: AppStyle.DEFAULT_12.copyWith(color: AppColors.white),
      ),
    );
    switch (accountStyles) {
      case AccountStyles.investors:
        widget = Container(
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.redDD,
          ),
          child: Text(
            'Nhà đầu tư',
            style: AppStyle.DEFAULT_12.copyWith(color: AppColors.white),
          ),
        );
        break;
      case AccountStyles.accountOwner:
        widget = Container(
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.orangefe,
          ),
          child: Text(
            'Chủ tài khoản',
            style: AppStyle.DEFAULT_12.copyWith(color: AppColors.white),
          ),
        );
        break;
      default:
    }
    return widget;
  }
}
