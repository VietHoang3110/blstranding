import 'package:flutter/material.dart';

import '../../../src/models/model_generator/home.dart';
import '../../../src/src_index.dart';
import '../../widget_ui/widget_card_home.dart';


class InvestmentPortfolio extends StatelessWidget {
  List<HomeList>? homeList;
  InvestmentPortfolio({
    Key? key,
    this.homeList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.greyF5,
      // height: size.height * .7,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Danh mục đầu tư',
                style: AppStyle.DEFAULT_16
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              // InkWell(
              //   onTap: (){
              //     print("aaa- ${AccountStyles.values}");
              //   },
              //   child: Text(
              //     "Xem thêm",
              //     style: AppStyle.DEFAULT_14.copyWith(
              //         decoration: TextDecoration.underline,
              //         color: AppColors.grey),
              //   ),
              // ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            children: List.generate(homeList!.length, (index) => InvestmentCard(
              codeCK: homeList![index].mack,
              total: homeList![index].ton.toString(),
              priceTT: homeList![index].giadongcua,
              totalMoney: homeList![index].tienban.toString(),
              status: homeList![index].tinhtrang,
              loinhuan: homeList![index].loinhuan,
            )),
          )
          // ...homelist.map(
          //   (e) => InvestmentCard(
          //     codeCK: e.mack,
          //     total: e.ton,
          //     priceTT: e.giadongcua,
          //     totalMoney: e.tienban.toString(),
          //     status: e.tinhtrang,
          //   ),
          // )
        ],
      ),
    );
  }
}


