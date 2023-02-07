
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/screens/widget_ui/widget_history.dart';
import 'package:quan_ly/widgets/widget/widget_header.dart';
import '../../../../bloc/sumrealized_own/sumrealized_own_bloc.dart';
import '../../../../src/src_index.dart';
import '../../../widget_ui/widget_drawer.dart';


class SummaryOfSettlementsOwn extends StatefulWidget {
  const SummaryOfSettlementsOwn({Key? key}) : super(key: key);

  @override
  State<SummaryOfSettlementsOwn> createState() => _SummaryOfSettlementsOwnState();
}

class _SummaryOfSettlementsOwnState extends State<SummaryOfSettlementsOwn> {

  @override
  void initState() {
    SumrealizedOwnBloc.of(context).add(InitGetSumrealizedOwnEvent());
    super.initState();
  }
  int indexList = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WidgetDrawer(),
      body: BlocBuilder<SumrealizedOwnBloc, SumrealizedOwnState>(
        builder: (context, state) {
          if(state is UpdateGetSumrealizedOwnState){
            return Container(
              color: AppColors.bgGray,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).padding.top,
                    color: AppColors.white,
                  ),
                  const WidgetHeader(
                    title: 'Tổng hợp tất toán',
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
                                        title: state.data.total![0].name ??"",
                                        value: (state.data.total![0].value ?? "").toString(),
                                        color: AppColors.bgblue),
                                    WidgetHistory(
                                        icon: 'assets/icons/sell.svg',
                                        title:  state.data.total![4].name ??"",
                                        value: (state.data.total![4].value ?? "").toString(),
                                        color: AppColors.bgorange),
                                  ],
                                ),
                                Column(
                                  children: [
                                    WidgetHistory(
                                        icon: 'assets/icons/wallet.svg',
                                        title: state.data.total![1].name ??"",
                                        value: (state.data.total![1].value ?? "").toString(),
                                        color: AppColors.bggreen),
                                    WidgetHistory(
                                        icon: 'assets/icons/totalSell.svg',
                                        title: state.data.total![5].name ??"",
                                        value: (state.data.total![5].value ?? "").toString(),
                                        color: AppColors.bgred),
                                  ],
                                ),
                                Column(
                                  children: [
                                    WidgetHistory(
                                        icon: 'assets/icons/11.svg',
                                        title: state.data.total![2].name ??"",
                                        value: (state.data.total![2].value ?? "").toString(),
                                        color: AppColors.bgorange),
                                    WidgetHistory(
                                        icon: 'assets/icons/13.svg',
                                        title:  state.data.total![6].name ??"",
                                        value: (state.data.total![6].value ?? "").toString(),
                                        color: AppColors.bgblue),
                                  ],
                                ),
                                Column(
                                  children: [
                                    WidgetHistory(
                                        icon: 'assets/icons/12.svg',
                                        title: state.data.total![3].name ??"",
                                        value: (state.data.total![3].value ?? "").toString(),
                                        color: AppColors.bgred),
                                    WidgetHistory(
                                        icon: 'assets/icons/14.svg',
                                        title: state.data.total![7].name ??"",
                                        value: (state.data.total![7].value ?? "").toString(),
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
                                            'Giá bán bình quân',
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
                                            'Tổng',
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
                                            'Tổng',
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

                                    ],
                                    rows:  List.generate(state.data.datatable!.length,
                                            (indexList) => DataRow(
                                            color: MaterialStateProperty.resolveWith((states) =>
                                            indexList % 2 != 0 ? AppColors.greyE6 : AppColors.white),
                                            cells: [
                                              DataCell(Text((state.data.datatable![indexList].code ?? '').toString())),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].quantity ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].sellPriceAvg ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].sellMoney ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].sellFee ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].sellTotal ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].sellFeeAvg ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].buyMoney ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].buyFee ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].buyTotal ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].loanFee ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].advanceFee ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].profit ?? '').toString()))),
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
