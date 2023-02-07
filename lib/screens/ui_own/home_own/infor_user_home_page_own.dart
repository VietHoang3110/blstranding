import 'package:flutter/material.dart';

import '../../../src/models/model_generator/home_own.dart';
import '../../../src/src_index.dart';
import '../../widget_ui/widget_card_home.dart';

class InforUserHomePageOwn extends StatelessWidget {
  List<HomeOwnInfo>? homeInfo;
  InforUserHomePageOwn({
    Key? key,
    this.homeInfo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: AppColors.greyF5,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Thông tin tài khoản',
                style: AppStyle.DEFAULT_16_BOLD,
              ),
              // Text(
              //   'Xem thêm',
              //   style: AppStyle.DEFAULT_14.copyWith(
              //       decoration: TextDecoration.underline,
              //       color: AppColors.grey),
              // ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            children: List.generate(homeInfo!.length, (index) => (index != null) ? RowInfor(
              number: '${index + 1}',
              textCenterLeft: homeInfo![index].name,
              textCenterRight: homeInfo![index].value,
              suffixText: null,
              color: AppColors.green,
            ) : Container(),
            ),
          )
        ],
      ),
    );
  }
}


