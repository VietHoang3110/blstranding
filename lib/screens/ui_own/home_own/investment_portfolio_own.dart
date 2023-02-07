import 'package:flutter/material.dart';

import '../../../src/models/model_generator/home_own.dart';
import '../../../src/src_index.dart';


class InvestmentPortfolioOwn extends StatelessWidget {
  List<HomeOwnList>? homeList;
  InvestmentPortfolioOwn({
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

class InvestmentCard extends StatelessWidget {
  const InvestmentCard({
    Key? key,
    this.codeCK,
    this.total,
    this.priceTT,
    this.totalMoney,
    this.status,
  }) : super(key: key);
  final String? codeCK, total, priceTT, totalMoney, status;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5)),
          height: 120,
          // margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text(
                        "Mã CK",
                        style: AppStyle.DEFAULT_14.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        codeCK ?? "CTR",
                        style: AppStyle.DEFAULT_14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text(
                        "GTTT",
                        style: AppStyle.DEFAULT_14.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        totalMoney ?? "247,500,000",
                        style: AppStyle.DEFAULT_14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Số lượng",
                    style: AppStyle.DEFAULT_14.copyWith(
                        color: AppColors.black, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    total ?? "3000000",
                    style: AppStyle.DEFAULT_14.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      Text(
                        "Giá TT",
                        style: AppStyle.DEFAULT_14.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        priceTT ?? "82.000",
                        style: AppStyle.DEFAULT_14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      Text(
                        'Tình trạng',
                        style: AppStyle.DEFAULT_14.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        status ?? "T2",
                        style: AppStyle.DEFAULT_14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(color: Colors.black,height: 1,)
      ],
    );
  }
}
