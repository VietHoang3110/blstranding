import 'package:flutter/widgets.dart';
import 'package:quan_ly/src/src_index.dart';


Column logoApp() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset("assets/icons/logo-blue.png"),
      const SizedBox(
        height: 15,
      ),
      Text(
        'Đăng ký',
        style: AppStyle.DEFAULT_20.copyWith(fontWeight: FontWeight.w600),
      ),
    ],
  );
}
