
import 'package:quan_ly/widgets/widgets.dart';
import 'package:flutter/material.dart';


class ForgotPasswordOTPScreen extends StatefulWidget {

  @override
  ForgotPasswordOTPScreenState createState() => ForgotPasswordOTPScreenState();
}

class ForgotPasswordOTPScreenState extends State<ForgotPasswordOTPScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: WidgetTouchHideKeyBoard(
            child: Center(
              child: Text("password_otp"),
            ),
          )
      )
    );
  }
}
