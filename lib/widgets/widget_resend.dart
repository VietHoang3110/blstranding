import 'package:flutter/material.dart';
import 'package:quan_ly/src/color.dart';
import 'package:quan_ly/src/get_snack_bar_utils.dart';
import 'package:quan_ly/src/messages.dart';
import 'package:quan_ly/src/styles.dart';
import 'package:quan_ly/src/values.dart';
import 'package:quan_ly/widgets/widgets.dart';

class WidgetResend extends StatelessWidget {
  final Function onTap;
  final int time;
  final bool isValid;

  const WidgetResend({Key? key, required this.onTap, required this.time, required this.isValid}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    String tmpTime = '';
    if (time < 10) {
      tmpTime = '00:0$time';
    } else {
      tmpTime = '00:$time';
    }
    return Container(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          Text(
            MESSAGES.NO_OTP,
            style: AppStyle.DEFAULT_16,
          ),
          AppValue.hSpaceTiny,
          WidgetLink(
            text: !isValid ? MESSAGES.RESEND + '($tmpTime)' : MESSAGES.RESEND,
            style: !isValid
                ? AppStyle.DEFAULT_16_BOLD.copyWith(color: AppColors.greyE1, decoration: TextDecoration.underline)
                : AppStyle.DEFAULT_16_BOLD.copyWith(color: AppColors.black, decoration: TextDecoration.underline),
            onTap: (){
              !isValid ? GetSnackBarUtils.createWarning(message: MESSAGES.TRY_AGAIN) : onTap();
            },
          )
        ],
      ),
    );
  }
}
