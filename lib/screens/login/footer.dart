import 'package:flutter/material.dart';

import '../../src/src_index.dart';


class WidgetFooter extends StatelessWidget {
  const WidgetFooter({Key? key, this.text}) : super(key: key);
  final Widget? text;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/bottom_backgound.png",
          height: AppValue.heights * 0.2,
          width: AppValue.widths,
          fit: BoxFit.fill,
        ),
        Positioned.fill(
          bottom: 15,
          child: Align(
              alignment: Alignment.bottomCenter,
              // child: text ??
              //     InkWell(
              //       // onTap: () {
              //       //   navigatorKey.currentState!.pushNamed('RegisterScreen');
              //       // },
              //       child: Row(mainAxisSize: MainAxisSize.min, children: [
              //         Text(
              //           "Bạn chưa có tài khoản? ",
              //           style: AppStyle.DEFAULT_14
              //               .copyWith(fontWeight: FontWeight.w500),
              //         ),
              //         Text(
              //           "Đăng ký",
              //           style: AppStyle.DEFAULT_14.copyWith(
              //               fontWeight: FontWeight.w500,
              //               color: AppColors.primaryColor),
              //         ),
              //       ]),
              //     )
          ),
        )
      ],
    );
  }
}
