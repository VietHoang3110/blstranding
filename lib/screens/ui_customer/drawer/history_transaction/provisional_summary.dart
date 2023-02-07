import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/bloc/sumunrealized/sumunrealized_bloc.dart';
import 'package:quan_ly/widgets/widget/widget_header.dart';
import '../../../../src/src_index.dart';
import '../../../widget_ui/widget_drawer.dart';
import '../../../widget_ui/widget_history.dart';


class ProvisionalSummary extends StatefulWidget {
  const ProvisionalSummary({Key? key}) : super(key: key);

  @override
  State<ProvisionalSummary> createState() => _ProvisionalSummaryState();
}

class _ProvisionalSummaryState extends State<ProvisionalSummary> {

  @override
  void initState() {
    SumunrealizedBloc.of(context).add(InitGetSumunrealizedEvent());
    super.initState();
  }
  int indexList = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WidgetDrawer(),
      body: BlocBuilder<SumunrealizedBloc, SumunrealizedState>(
        builder: (context, state) {
          if(state is UpdateGetSumunrealizedState){
            return Container(
              color: AppColors.bgGray,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).padding.top,
                    color: AppColors.white,
                  ),
                  const WidgetHeader(
                    title: 'Tổng hợp tạm tính',
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        WidgetHistory(
                                            icon: 'assets/icons/buy.svg',
                                            title: state.data.total![0].name ??"",
                                            value: (state.data.total![0].value ?? 0).toString(),
                                            color: AppColors.bgblue),
                                        WidgetHistory(
                                            icon: 'assets/icons/sell.svg',
                                            title:  state.data.total![4].name ??"",
                                            value: (state.data.total![4].value ?? 0).toString(),
                                            color: AppColors.bgorange),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        WidgetHistory(
                                            icon: 'assets/icons/wallet.svg',
                                            title: state.data.total![1].name ??"",
                                            value: (state.data.total![1].value ?? 0).toString(),
                                            color: AppColors.bggreen),
                                        WidgetHistory(
                                            icon: 'assets/icons/totalSell.svg',
                                            title: state.data.total![5].name ??"",
                                            value: (state.data.total![5].value ?? 0).toString(),
                                            color: AppColors.bgred),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        WidgetHistory(
                                            icon: 'assets/icons/11.svg',
                                            title: state.data.total![2].name ??"",
                                            value: (state.data.total![2].value ?? 0).toString(),
                                            color: AppColors.bgorange),
                                        WidgetHistory(
                                            icon: 'assets/icons/13.svg',
                                            title:  state.data.total![6].name ??"",
                                            value: (state.data.total![6].value ?? 0).toString(),
                                            colorText: (state.data.total![7].value![0] == "-")
                                                ? AppColors.red : AppColors.green,
                                            color: AppColors.bgblue),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        WidgetHistory(
                                            icon: 'assets/icons/12.svg',
                                            title: state.data.total![3].name ??"",
                                            value: (state.data.total![3].value ?? 0).toString(),
                                            color: AppColors.bgred),
                                        WidgetHistory(
                                            icon: 'assets/icons/14.svg',
                                            title: state.data.total![7].name ??"",
                                            value: (state.data.total![7].value ?? 0).toString(),
                                            colorText: (state.data.total![7].value![0] == "-")
                                                ? AppColors.red : AppColors.green,
                                            color: AppColors.bggreen),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          AppValue.vSpaceSmall,
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 16,
                                  ),
                                  Container(
                                      color: AppColors.white, child: DataTable(
                                    border: TableBorder.all(width: 1, color: AppColors.bgGray),
                                    columns: [
                                      DataColumn(
                                          label: Text(
                                            'Mã',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Số lượng',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Giá mua bình quân',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Thành tiền mua',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Phí mua',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Tổng tiền mua',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Giá đóng cửa',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Giá chặn',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Thành tiền bán',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Phí bán',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Thành tiền bán sau phí bán',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Phí vay',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Phí ứng',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: SizedBox(
                                            width: AppValue.widths*0.25,
                                            child: Text(
                                              'Lợi nhuận',
                                              textAlign: TextAlign.center,
                                              style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                            ),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            '% lợi nhuận',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),

                                    ],
                                    rows:  List.generate(state.data.rows!.length,
                                            (indexList) => DataRow(
                                            color: MaterialStateProperty.resolveWith((states) =>
                                            indexList % 2 != 0 ? AppColors.greyE6 : AppColors.white),
                                            cells: [
                                              DataCell(Text((state.data.rows![indexList].code ?? '').toString())),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].amount ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].averagePrice ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].buyMoney ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].feeBuy ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].totalMoneyBuy ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].closingPrice ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].limitPrice ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].tolalMoneyBuy ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].feeSell ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].totalMoneySell ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].feeLoan ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].advanceMoneyFee ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].profit ?? '').toString(),
                                                      style: AppStyle.DEFAULT_14.copyWith(
                                                          color: (state.data.rows![indexList].profit![0] == "-")
                                                              ? AppColors.red : AppColors.green
                                                      )
                                                  ))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].percent ?? '').toString(),
                                                    style: AppStyle.DEFAULT_14.copyWith(
                                                        color: (state.data.rows![indexList].percent![0] == "-")
                                                            ? AppColors.red : AppColors.green
                                                    ),))),
                                            ])),
                                  )),
                                  Container(
                                    width: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          else{
            return Container();
          }
        },
      ),
    );
  }
}
