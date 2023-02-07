import 'package:quan_ly/src/src_index.dart';
import 'package:quan_ly/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WidgetHeaderBar extends StatelessWidget {
  final String? title;
  final String? icon;
  final Color? backgroundColor;
  final Widget? right;
  final bool? isTitleCenter;
  final bool? isDivider;

  WidgetHeaderBar({this.title, this.icon, this.right, this.backgroundColor, this.isTitleCenter, this.isDivider});

  @override
  Widget build(BuildContext context) {
    return WidgetAppbar(
      textColor: AppColors.white,
      left: WidgetBackButton(),
      right: right,
      title: title,
      backgroundColor: backgroundColor,
      isTitleCenter: isTitleCenter,
      isDivider: isDivider,
    );
  }
}
