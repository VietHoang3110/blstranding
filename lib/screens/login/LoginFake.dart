import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:quan_ly/widgets/widget_text.dart';

import '../../bloc/login/login_bloc.dart';
import '../../src/src_index.dart';
import '../../widgets/widget/widget_button.dart';

class LoginFake extends StatefulWidget {
  const LoginFake({Key? key}) : super(key: key);

  @override
  State<LoginFake> createState() => _LoginFakeState();
}

class _LoginFakeState extends State<LoginFake> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == FormzStatus.submissionSuccess) {
            AppNavigator.navigateMain();
        } else if (state.status == FormzStatus.submissionFailure) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Thông báo'),
                content: const Text("Tên đăng nhập hoặc mật khẩu không chính xác"),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: AppValue.heights,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/icons/logo-blue.png"),
                WidgetText(
                  title: "Click để khám phá",
                  style: AppStyle.DEFAULT_20.copyWith(
                    color: AppColors.primaryColor
                  ),
                ),
                WidgetButton(
                  text: "Khám phá",
                  ontap: () {
                    LoginBloc.of(context).add(FormSubmitted(
                        'phuloi', '53fce0f54b09633ef5cdf554097168c0', '1'));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
