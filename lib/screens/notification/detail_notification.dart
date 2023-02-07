import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quan_ly/src/src_index.dart';
import 'package:quan_ly/widgets/widget_text.dart';

import '../../bloc/noti/noti_bloc.dart';
import '../../src/models/model_generator/noti.dart';
import '../../src/spacing.dart';
import '../../widgets/widget/main_layout.dart';

class DetailNotificationPage extends StatefulWidget {
  const DetailNotificationPage({Key? key}) : super(key: key);

  @override
  State<DetailNotificationPage> createState() => _DetailNotificationPageState();
}

class _DetailNotificationPageState extends State<DetailNotificationPage> {
  Noti data = Get.arguments[0];
  int page = Get.arguments[1];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appbarColor: AppColors.white,
      appbarTitle: 'Chi tiết thông báo',
      appbarLeading: IconButton(
        onPressed: () {
          Get.back();
          NotiBloc.of(context).add(InitGetNotiEvent(page,10));
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: AppColors.black,
          size: 28,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetText(
              title: data.name,
              style: AppStyle.DEFAULT_14.copyWith(
                fontWeight: FontWeight.w500
              ),
            ),
            AppValue.vSpace(5),
            WidgetText(
              title: data.date,
              style: AppStyle.DEFAULT_12.copyWith(
                  fontWeight: FontWeight.w400,
                color: AppColors.grey
              ),
            ),
            AppValue.vSpace(10),
            WidgetText(
              title: data.content,
              style: AppStyle.DEFAULT_14.copyWith(
                  fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      )
    );
  }
}
