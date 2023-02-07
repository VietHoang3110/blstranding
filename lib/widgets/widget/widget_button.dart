import 'package:flutter/material.dart';
import 'package:quan_ly/src/src_index.dart';


class WidgetButton extends StatelessWidget {
  const WidgetButton({
    this.isPrimaryButton = true,
    Key? key,
    this.ontap,
    this.backgroundColor,
    this.widgetText,
    this.prefixIcon,
    this.text,
  }) : super(key: key);
  final bool isPrimaryButton;
  final String? text;
  final Color? backgroundColor;

  final Widget? prefixIcon, widgetText;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: backgroundColor ??
              (isPrimaryButton ? AppColors.primaryColor : AppColors.white),
          borderRadius: BorderRadius.circular(5),
          border: backgroundColor == null
              ? Border.all(width: 1, color: AppColors.greyE1)
              : null,
          boxShadow: isPrimaryButton
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            prefixIcon ?? const SizedBox(),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: widgetText ??
                    Text(
                      text ?? "Đăng nhập",
                      style: AppStyle.DEFAULT_16.copyWith(
                          color: isPrimaryButton
                              ? AppColors.white
                              : AppColors.black),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
