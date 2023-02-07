import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/screens/widget_ui/widget_history.dart';
import 'package:quan_ly/widgets/widget/widget_header.dart';
import '../../../../bloc/sumunrealized_own/sumunrealized_own_bloc.dart';
import '../../../../src/src_index.dart';
import '../../../widget_ui/widget_drawer.dart';


class ProvisionalSummaryOwn extends StatefulWidget {
  const ProvisionalSummaryOwn({Key? key}) : super(key: key);

  @override
  State<ProvisionalSummaryOwn> createState() => _ProvisionalSummaryOwnState();
}

class _ProvisionalSummaryOwnState extends State<ProvisionalSummaryOwn> {

  @override
  void initState() {
    SumunrealizedOwnBloc.of(context).add(InitGetSumunrealizedOwnEvent());
    super.initState();
  }
  int indexList = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WidgetDrawer(),
      body: BlocBuilder<SumunrealizedOwnBloc, SumunrealizedOwnState>(
        builder: (context, state) {
          if(state is UpdateGetSumunrealizedOwnState){
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
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    WidgetHistory(
                                        icon: 'assets/icons/buy.svg',
                                        title: state.data.toTal![0].name ??"",
                                        value: (state.data.toTal![0].value ?? 0).toString(),
                                        color: AppColors.bgblue),
                                    WidgetHistory(
                                        icon: 'assets/icons/sell.svg',
                                        title:  state.data.toTal![4].name ??"",
                                        value: (state.data.toTal![4].value ?? 0).toString(),
                                        color: AppColors.bgorange),
                                  ],
                                ),
                                Column(
                                  children: [
                                    WidgetHistory(
                                        icon: 'assets/icons/wallet.svg',
                                        title: state.data.toTal![1].name ??"",
                                        value: (state.data.toTal![1].value ?? 0).toString(),
                                        color: AppColors.bggreen),
                                    WidgetHistory(
                                        icon: 'assets/icons/totalSell.svg',
                                        title: state.data.toTal![5].name ??"",
                                        value: (state.data.toTal![5].value ?? 0).toString(),
                                        color: AppColors.bgred),
                                  ],
                                ),
                                Column(
                                  children: [
                                    WidgetHistory(
                                        icon: 'assets/icons/11.svg',
                                        title: state.data.toTal![2].name ??"",
                                        value: (state.data.toTal![2].value ?? 0).toString(),
                                        color: AppColors.bgorange),
                                    WidgetHistory(
                                        icon: 'assets/icons/13.svg',
                                        title:  state.data.toTal![6].name ??"",
                                        value: (state.data.toTal![6].value ?? 0).toString(),
                                        color: AppColors.bgblue),
                                  ],
                                ),
                                Column(
                                  children: [
                                    WidgetHistory(
                                        icon: 'assets/icons/12.svg',
                                        title: state.data.toTal![3].name ??"",
                                        value: (state.data.toTal![3].value ?? 0).toString(),
                                        color: AppColors.bgred),
                                    WidgetHistory(
                                        icon: 'assets/icons/14.svg',
                                        title: state.data.toTal![7].name ??"",
                                        value: (state.data.toTal![7].value ?? 0).toString(),
                                        color: AppColors.bggreen),
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
                                            'Thành tiền',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Phí mua',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Tổng',
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
                                            'Tạm tính',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Phí bán',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Tổng tạm tính',
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
                                          label: Text(
                                            'Lợi nhuận',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            '%',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),

                                    ],
                                    rows:  List.generate(state.data.dataTable!.length,
                                            (indexList) => DataRow(
                                            color: MaterialStateProperty.resolveWith((states) =>
                                            indexList % 2 != 0 ? AppColors.greyE6 : AppColors.white),
                                            cells: [
                                              DataCell(Text((state.data.dataTable![indexList].code ?? '').toString())),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.dataTable![indexList].amount ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text(state.data.dataTable![indexList].purchasePrice.toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text(state.data.dataTable![indexList].intoMoney.toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.dataTable![indexList].buyFee ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.dataTable![indexList].total ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.dataTable![indexList].closePrice ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.dataTable![indexList].limitPrice ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.dataTable![indexList].provisional ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.dataTable![indexList].purchaseSell ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.dataTable![indexList].provisionalTotal ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.dataTable![indexList].loanFee ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.dataTable![indexList].dvanceMoneyPurchase ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.dataTable![indexList].profit ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.dataTable![indexList].percent ?? '').toString()))),
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
