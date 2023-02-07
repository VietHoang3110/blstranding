import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quan_ly/src/src_index.dart';
// ignore: import_of_legacy_library_into_null_safe

class WidgetText extends StatelessWidget {
  final String? title;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLine;

  WidgetText({this.title, this.style, this.textAlign, this.maxLine, this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      textAlign: textAlign ?? textAlign,
      style: style ?? AppStyle.DEFAULT_16.copyWith(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
      overflow: textOverflow,
      maxLines: maxLine,
    );
  }
}