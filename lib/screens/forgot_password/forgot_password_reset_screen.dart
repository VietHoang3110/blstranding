import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/bloc/blocs.dart';
import 'package:quan_ly/screens/forgot_password/index.dart';
import 'package:quan_ly/src/src_index.dart';
import 'package:quan_ly/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ForgotPasswordResetScreen extends StatefulWidget {

  @override
  ForgotPasswordResetScreenState createState() => ForgotPasswordResetScreenState();
}

class ForgotPasswordResetScreenState extends State<ForgotPasswordResetScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: WidgetTouchHideKeyBoard(
            child: Center(
              child: Text("reset pass"),
            ),
          )
      )
    );
  }
}
