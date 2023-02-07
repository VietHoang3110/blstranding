import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../src/src_index.dart';


class WidgetInput extends StatefulWidget {
  const WidgetInput({
    this.controller,
    Key? key,
    this.hintText,
    this.label,
    this.errorText,
    this.prefixIcon,
    this.onEditingComplete,
    this.inputBorder,
    this.suffixIcon,
    this.onChanged,
    this.enable = true,
    this.height = 60.0,
    this.isPassword = false,
  }) : super(key: key);
  final String? hintText, label;
  final TextEditingController? controller;
  final bool isPassword, enable;
  final String? errorText;
  final InputBorder? inputBorder;
  final Widget? prefixIcon, suffixIcon;
  final Function(String)? onChanged;
  final double? height;
  final VoidCallback? onEditingComplete;
  @override
  State<WidgetInput> createState() => _WidgetInputState();
}

class _WidgetInputState extends State<WidgetInput> {
  SvgPicture suffixIcon = SvgPicture.asset(
    "assets/icons/eye_remove.svg",
    fit: BoxFit.scaleDown,
  );
  @override
  void initState() {
    showPassword = widget.isPassword;
    super.initState();
  }

  late bool showPassword;
  @override
  Widget build(BuildContext context) {
    bool isError = widget.errorText != null;
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            enabled: widget.enable,
            onEditingComplete: widget.onEditingComplete,
            onChanged: widget.onChanged,
            controller: widget.controller,
            obscureText: showPassword,
            decoration: InputDecoration(
                constraints: const BoxConstraints(maxHeight: 44),
                hintText: widget.hintText ?? "Email",
                labelText: widget.label,
                focusedBorder: widget.inputBorder != null
                    ? widget.inputBorder!.copyWith(
                        borderSide:  BorderSide(
                            color: AppColors.primaryColor, width: 1.0))
                    :  UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.primaryColor, width: 1.0),
                      ),
                enabledBorder: widget.inputBorder != null
                    ? widget.inputBorder!.copyWith(
                        borderSide: BorderSide(
                          color:
                              !isError ? AppColors.grey : AppColors.errorColor,
                          width: 1.0,
                        ),
                      )
                    : UnderlineInputBorder(
                        borderSide: BorderSide(
                          color:
                              !isError ? AppColors.grey : AppColors.errorColor,
                          width: 1.0,
                        ),
                      ),
                contentPadding: const EdgeInsets.fromLTRB(12, 11, 12, 11),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.isPassword
                    ? InkWell(
                        child: showPassword
                            ? SvgPicture.asset(
                          "assets/icons/eye_remove.svg",
                          fit: BoxFit.scaleDown,
                        )
                            : SvgPicture.asset(
                          "assets/icons/eye.svg",
                          fit: BoxFit.scaleDown,
                        ),
                        onTap: () {
                          setState(() {
                            // suffixIcon =
                            showPassword = !showPassword;
                          });
                        },
                      )
                    : widget.suffixIcon ?? const SizedBox()),
          ),
          widget.errorText == null
              ? const SizedBox()
              : Text(
                  widget.errorText!,
                  style: AppStyle.DEFAULT_12
                      .copyWith(color: AppColors.errorColor),
                )
        ],
      ),
    );
  }
}
