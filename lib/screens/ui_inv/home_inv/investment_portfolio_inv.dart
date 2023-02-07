

import 'package:flutter/material.dart';

import '../../../src/models/model_generator/home_inv.dart';
import '../../../src/src_index.dart';


class InvestmentPortfolioInv extends StatelessWidget {
  List<HomeInvList>? homeList;
  HomeInvData? data;

  InvestmentPortfolioInv({
    Key? key,
    this.homeList,
    this.data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<HomeInvList>? homelistNew = homeList;
    homelistNew!.add(
        HomeInvList(
          id: '',
          name: "Tổng",
          investmentContractMoney: data!.totalMoney,
          capitalContributionDate: '',
          profitRate: '',
          hasWithdrawnOrigin: '',
          hasWithdrawnInterest: '',
          originSurplus: data!.totalSurplus,
          numberDate: '',
          profitDate: '',
          provisionalProfit: data!.totalProfit
        )
    );


    return Container(
      color: AppColors.greyF5,
      // height: size.height * .7,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          border: TableBorder.all(width: 1, color: AppColors.bgGray),
          columns: [
            DataColumn(
                label: Text(
                  'Số HĐ',
                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                )),
            DataColumn(
                label: SizedBox(
                  width: AppValue.widths*0.3,
                  child: Text(
                    'Số tiền',
                    style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                )),
            DataColumn(
                label: Text(
                  'Ngày góp vốn',
                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                )),
            DataColumn(
                label: Text(
                  'Tỷ suất LN',
                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                )),
            DataColumn(
                label: Text(
                  'Gốc đã rút',
                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                )),
            DataColumn(
                label: Text(
                  'Lãi đã rút',
                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                )),
            DataColumn(
                label: SizedBox(
                  width: AppValue.widths*0.3,
                  child: Text(
                    'Số dư gốc',
                    style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                )),
            DataColumn(
                label: Text(
                  'Số ngày góp vốn',
                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                )),
            DataColumn(
                label: Text(
                  'Ngày trả lợi nhuận',
                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                )),
            DataColumn(
                label: Text(
                  'Lợi nhuận tạm tính',
                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                )),
          ],
          rows: List.generate(homeList!.length,
                    (indexList) => DataRow(
                    color: MaterialStateProperty.resolveWith((states) =>
                    indexList % 2 != 0 ? AppColors.greyE6 : AppColors.white),
                    cells: [
                      DataCell(Text(
                          (homeList![indexList].name ?? '').toString(),
                          style: (indexList==(homeList!.length - 1)) ? AppStyle.DEFAULT_14_BOLD : AppStyle.DEFAULT_14,
                      )),

                      DataCell(Align(alignment: Alignment.centerRight,
                          child: Text((homeList![indexList].investmentContractMoney ?? '').toString(),
                              style: (indexList==(homeList!.length - 1)) ? AppStyle.DEFAULT_14_BOLD : AppStyle.DEFAULT_14
                          ))),

                      DataCell(Text((homeList![indexList].capitalContributionDate ?? '').toString())),

                      DataCell(Align(alignment: Alignment.centerRight,
                          child: Text((homeList![indexList].profitRate ?? '').toString()))),

                      DataCell(Align(alignment: Alignment.centerRight,
                          child: Text((homeList![indexList].hasWithdrawnOrigin ?? '').toString()))),

                      DataCell(Align(alignment: Alignment.centerRight,
                          child: Text((homeList![indexList].hasWithdrawnInterest ?? '').toString()))),

                      DataCell(Align(alignment: Alignment.centerRight,
                          child: Text((homeList![indexList].originSurplus ?? '').toString(),
                              style: (indexList==(homeList!.length - 1)) ? AppStyle.DEFAULT_14_BOLD : AppStyle.DEFAULT_14
                          ))),

                      DataCell(Align(alignment: Alignment.centerRight,
                          child: Text((homeList![indexList].numberDate ?? '').toString()))),

                      DataCell(Align(alignment: Alignment.centerRight,
                          child: Text((homeList![indexList].profitDate ?? '').toString()))),

                      DataCell(Align(alignment: Alignment.centerRight,
                          child: Text((homeList![indexList].provisionalProfit ?? '').toString(),
                              style: (indexList==(homeList!.length - 1)) ? AppStyle.DEFAULT_14_BOLD : AppStyle.DEFAULT_14
                          ))),
                    ]
                )
            ),
        ),
      ),
    );
  }
}
