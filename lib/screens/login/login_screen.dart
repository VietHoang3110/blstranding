import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:quan_ly/screens/login/footer.dart';
import 'package:quan_ly/src/src_index.dart';
import 'package:quan_ly/storages/share_local.dart';
import 'package:quan_ly/widgets/widget/widget_button.dart';
import 'package:quan_ly/widgets/widget/widget_input.dart';
import 'package:quan_ly/widgets/widgets.dart';

import '../../bloc/login/login_bloc.dart';

class LoginScreen extends StatefulWidget {

  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  PageController controller = PageController(initialPage: 0, keepPage: true);
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isSelect = true;

  AccountStyles _accountStyles = AccountStyles.customer;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == FormzStatus.submissionSuccess) {
          (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner") ? AppNavigator.navigateMainOwn()
              : (shareLocal.getString(PreferencesKey.USER_TYPE) == "customer") ?  AppNavigator.navigateMain()
              : AppNavigator.navigateMainInv();
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
        drawerEnableOpenDragGesture: false,
        body: DoubleBackToCloseApp(
          snackBar: SnackBar(
            content: Text(MESSAGES.BACK_TO_EXIT,
              style: AppStyle.DEFAULT_16.copyWith(color: AppColors.white),),
          ),
          child: WidgetTouchHideKeyBoard(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    height: AppValue.heights * 0.8,
                    width: AppValue.widths,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset("assets/icons/logo-blue.png"),
                        Text(
                          "Đăng nhập",
                          style: AppStyle.DEFAULT_20
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _accountStyles = AccountStyles.customer;
                                  print('$_accountStyles');
                                });
                              },
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 10,
                                    child: Radio<AccountStyles>(
                                      splashRadius: 0,
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      value: AccountStyles.customer,
                                      groupValue: _accountStyles,
                                      onChanged: (AccountStyles? value) {
                                       setState(() {
                                         _accountStyles = AccountStyles.customer;
                                       });
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Text(
                                    "Khách hàng",
                                    style: AppStyle.DEFAULT_12,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _accountStyles = AccountStyles.investors;
                                  print('$_accountStyles');
                                });
                              },
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Radio<AccountStyles>(
                                    splashRadius: 10,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    value: AccountStyles.investors,
                                    groupValue: _accountStyles,
                                    onChanged: (AccountStyles? value) {
                                      setState(() {
                                        _accountStyles = AccountStyles.investors;
                                      });
                                    },
                                  ),
                                  const Text(
                                    "Nhà đầu tư",
                                    style: AppStyle.DEFAULT_12,
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _accountStyles = AccountStyles.accountOwner;
                                  print('$_accountStyles');
                                });
                              },
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Radio<AccountStyles>(
                                    splashRadius: 10,
                                    materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                    value: AccountStyles.accountOwner,
                                    groupValue: _accountStyles,
                                    onChanged: (AccountStyles? value) {
                                      setState(() {
                                        _accountStyles = AccountStyles.accountOwner;
                                      });
                                    },
                                  ),
                                  const Text(
                                    "Chủ tài khoản",
                                    style: AppStyle.DEFAULT_12,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        loginForm(),
                      ],
                    ),
                  ),
                  const WidgetFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  int page = 0;

  Column loginForm() {
    return Column(
      children: [
        Column(
          children: [
            WidgetInput(
              controller: _emailController,
              hintText: 'Tên đăng nhập',
              prefixIcon: const Icon(Icons.mail_outline),
            ),
            WidgetInput(
              prefixIcon: const Icon(Icons.lock_outline),
              controller: _passwordController,
              isPassword: true,
              onEditingComplete: () {
                if(_accountStyles == AccountStyles.customer){
                  shareLocal.putString(PreferencesKey.USER_TYPE, "customer");
                }else{
                  if(_accountStyles == AccountStyles.investors) {
                    shareLocal.putString(PreferencesKey.USER_TYPE, "investors");
                  }
                  else{
                    shareLocal.putString(PreferencesKey.USER_TYPE, "owner");
                  }
                }
                LoginBloc.of(context).add(FormSubmitted(
                    _emailController.text,
                    _generateMd5(_passwordController.text),
                    _accountStyles == AccountStyles.customer
                        ? "1"
                        : _accountStyles == AccountStyles.investors
                        ? "2"
                        : "3"));
                FocusManager.instance.primaryFocus?.unfocus();
              },
              hintText: "Mật khẩu",
            ),
            AppValue.vSpaceSmall,

            // Align(
            //   alignment: Alignment.centerRight,
            //   child: InkWell(
            //     // onTap: () => navigatorKey.currentState!.pushNamed('ForgetPasswordScreen'),
            //     child: Text(
            //       "Quên mật khẩu",
            //       style: AppStyle.DEFAULT_14.copyWith(
            //           fontWeight: FontWeight.w500, color: AppColors.grey),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 5,
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return state.status != FormzStatus.submissionInProgress
                    ? WidgetButton(
                  text: "Đăng nhập",
                  ontap: () {
                    if(_accountStyles == AccountStyles.customer){
                      shareLocal.putString(PreferencesKey.USER_TYPE, "customer");
                    }else{
                      if(_accountStyles == AccountStyles.investors) {
                        shareLocal.putString(PreferencesKey.USER_TYPE, "investors");
                        }
                      else{
                        shareLocal.putString(PreferencesKey.USER_TYPE, "owner");
                      }
                    }
                    LoginBloc.of(context).add(FormSubmitted(
                        _emailController.text,
                        _generateMd5(_passwordController.text),
                        _accountStyles == AccountStyles.customer
                            ? "1"
                            : _accountStyles == AccountStyles.investors
                            ? "2"
                            : "3"));
                  },
                )
                    : const CircularProgressIndicator();
              },
            ),
          ],
        ),
        SizedBox(
          height: AppValue.heights * .02,
        ),
        // SizedBox(
        //   height: 120,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Row(
        //         mainAxisSize: MainAxisSize.max,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           SizedBox(
        //             width: size.width * .3,
        //             child: const Divider(
        //               color: AppColors.greyE6,
        //               height: 1,
        //               indent: 1,
        //             ),
        //           ),
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           Text(
        //             appLanguage['']!or,
        //             style: AppTextStyle.textStyle12.copyWith(
        //                 fontWeight: FontWeight.w500, color: AppColors.grey),
        //           ),
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           SizedBox(
        //             width: size.width * .3,
        //             child: const Divider(
        //               color: AppColors.greyE6,
        //               height: 1,
        //             ),
        //           ),
        //         ],
        //       ),
        //       WidgetButton(
        //         prefixIcon: SvgPicture.asset("assets/icons/ic_google.svg"),
        //         isPrimaryButton: false,
        //         ontap: () {
        //           navigatorKey.currentState!.pushNamed('RegisterScreen');
        //         },
        //         text: "Đăng nhập với Google",
        //       ),
        //       WidgetButton(
        //         prefixIcon: SvgPicture.asset("assets/icons/ic_facebook.svg"),
        //         isPrimaryButton: false,
        //         ontap: () {
        //           navigatorKey.currentState!.pushNamed('RegisterScreen');
        //         },
        //         text: "Đăng nhập với Facebook",
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
  String _generateMd5(String input) {
    String result = md5.convert(utf8.encode(input)).toString();
    return md5.convert(utf8.encode(result)).toString();
  }
}
