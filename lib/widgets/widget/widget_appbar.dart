import 'package:flutter/material.dart';

import '../../src/src_index.dart';


class WidgetAppbar extends StatelessWidget {
  final String? title;
  final Widget? widgetTitle;
  final Widget? left;
  final Widget? right;
  final Color? textColor, backgroundColor;
  final double? height;
  final bool? isTitleCenter;
  final bool? isDivider;

  const WidgetAppbar({
    Key? key,
    this.title,
    this.widgetTitle,
    this.left,
    this.right,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.height = 60,
    this.isTitleCenter = false,
    this.isDivider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width,
            height: height,
            child: Stack(
              children: [
                left != null
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: left),
                      )
                    : const SizedBox(),
                Align(
                  alignment: isTitleCenter == true
                      ? Alignment.center
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: isTitleCenter == true ? 0 : 70, right: 16),
                    child: widgetTitle ??
                        Text(
                          title ?? "",
                          style: AppStyle.DEFAULT_16.copyWith(
                              color: textColor, fontWeight: FontWeight.w500),
                        ),
                  ),
                ),
                right != null
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            padding: const EdgeInsets.only(right: 16),
                            child: right),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          isDivider == true
              ? const Divider(
                  color: AppColors.backgroundColor,
                  thickness: 0.8,
                  height: 0,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
