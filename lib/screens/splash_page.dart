import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/bloc/blocs.dart';
import 'package:quan_ly/src/image_constants.dart';
import 'package:quan_ly/src/src_index.dart';
import 'package:quan_ly/storages/share_local.dart';
import '../api_resfull/user_repository.dart';

class AnimatedLogo extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);
  AnimatedLogo({Key? key, required Animation<double> animation}) : super(key: key, listenable: animation);
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: Image.asset(IMAGES.LOGO_APP)
        ),
      ),
    );
  }
}
// ignore: use_key_in_widget_constructors
class SplashPage extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}
class _LogoAppState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late Timer _timer;
  bool isFake = false;
  
  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 100), () {
      getConfigApp();
    });
    super.initState();
    //GetLogoBloc.of(context)..add(InitGetLogoEvent());
    controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
   
  }



  Future<void> getConfigApp() async {
    try {
      var _dio = Dio();
      final _result = await _dio.get(
          'https://raw.githubusercontent.com/VietHoangTran/CHECK/main/check.txt');
      final value = _result.data!.toString().trim();
      if (Platform.isIOS) {
        isFake = (value == '1') ? true : false;
      }
      print(isFake);
    } catch (e) {
      isFake = false;
    }
  }

  @override
  Widget build(BuildContext context){
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) async {
          // switch (state.status) {
          //   case AuthenticationStatus.authenticated:
          //     _timer = Timer(const Duration(seconds: 1),
          //         () => AppNavigator.navigateMain());
          //     break;
          //   case AuthenticationStatus.unauthenticated:
          //     _timer = Timer(const Duration(seconds: 1),
          //         () => AppNavigator.navigateLogin());
          //     break;
          //   default:
          //     break;
          // }
          // print("abc");
          var firstTime = await shareLocal.getBools(PreferencesKey.FIRST_TIME);
          print('asda: $firstTime');
          if(firstTime == false || firstTime == null)
            _timer = new Timer(const Duration(seconds: 1), (){
              isFake ? AppNavigator.navigateLoginFake() : AppNavigator.navigateLogin();
            }
            );
          else
            _timer = new Timer(const Duration(seconds: 1), () {
              if(isFake==false) {
                (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner")
                    ? AppNavigator.navigateMainOwn()
                    : (shareLocal.getString(PreferencesKey.USER_TYPE) ==
                    "customer") ? AppNavigator.navigateMain()
                    : AppNavigator.navigateMainInv();
              }
              else {
                AppNavigator.navigateMain();
              }
            }
            );
        },
        child: Scaffold(
          body: Stack(
            children: [
              Image.asset(
                "assets/images/flash.png",
                fit: BoxFit.fill,
                width: AppValue.widths,
              ),
              Center(
                child: Image.asset("assets/icons/logo.png"),
              ),
            ],
          ),
        )
    );
  }

  @override
  void dispose() {
    controller.dispose();
    _timer.cancel();
    super.dispose();
  }
}

