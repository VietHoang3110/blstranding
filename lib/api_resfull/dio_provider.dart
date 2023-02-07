// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart' show Dio, LogInterceptor;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:quan_ly/src/src_index.dart';
import 'package:quan_ly/widgets/widget_dialog.dart';

import '../storages/share_local.dart';

class DioProvider {
  static final Dio _dio = Dio();
  static Dio instance({String? token}) {
    _dio
      ..options.baseUrl = dotenv.env[PreferencesKey.BASE_URL]!
      ..options.connectTimeout = BASE_URL.connectionTimeout
      ..options.receiveTimeout = BASE_URL.receiveTimeout
      ..options.headers = {
        // BASE_URL.content_type: BASE_URL.application_json,
        // BASE_URL.auth_type: "Bearer $token",
        BASE_URL.auth_type : token,
      }
      ..options.followRedirects = false
      ..options.validateStatus = (status){
      if(status == 402){
        try{
          Get.back();
          print('$status');
          WidgetsBinding.instance.addPostFrameCallback((_) => Get.dialog(
              WidgetDialog(
              title: MESSAGES.NOTIFICATION,
              content: "Tài khoản đã được đăng nhập trên thiết bị khác. Mời đăng nhập lại.",
              textButton1: "OK",
              backgroundButton1: AppColors.primaryColor,
              onTap1: () async{
                await shareLocal.putBools(PreferencesKey.FIRST_TIME, false);
                AppNavigator.navigateLogin();
              }
          )));
        } catch (e){
          print("lỗi $e");
        }
      }
      return status! < 503;
    }
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ));
    return _dio;
  }
}
