
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/bloc/sumrealized/sumrealized_bloc.dart';
import 'package:quan_ly/widgets/widget/widget_header.dart';
import '../../../../src/src_index.dart';
import '../../../widget_ui/widget_card_home.dart';
import '../../../widget_ui/widget_drawer.dart';
import '../../../widget_ui/widget_history.dart';


class SummaryOfSettlements extends StatefulWidget {
  const SummaryOfSettlements({Key? key}) : super(key: key);

  @override
  State<SummaryOfSettlements> createState() => _SummaryOfSettlementsState();
}

class _SummaryOfSettlementsState extends State<SummaryOfSettlements> {
  int indexList = 0;
  int page = 1;
  @override
  void initState() {
    SumrealizedBloc.of(context).add(InitGetSumrealizedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WidgetDrawer(),
      body: BlocBuilder<SumrealizedBloc, SumrealizedState>(
        builder: (context, state) {
          if(state is UpdateGetSumrealizedState){
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
                                            'Giá mua BQ',
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
                                            'Giá bán BQ',
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
                                            'Tổng tiền bán',
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
                                            '% Lợi nhuận',
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
                                                  child: Text((state.data.datatable![indexList].buyPriceAgv ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].buyIntoMoney ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].buyFee ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].buyTotal ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].sellPriceAgv ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].sellIntoMoney ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].sellFee ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].sellTotal ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].loanFee ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].advanceFee ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].profit ?? '').toString(),
                                                      style: AppStyle.DEFAULT_14.copyWith(
                                                          color: (state.data.datatable![indexList].profit![0] == "-")
                                                              ? AppColors.red : AppColors.green
                                                      )
                                                  ))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.datatable![indexList].percent ?? '').toString(),
                                                      style: AppStyle.DEFAULT_14.copyWith(
                                                          color: (state.data.datatable![indexList].percent![0] == "-")
                                                              ? AppColors.red : AppColors.green
                                                      )
                                                  ))),
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
                  // build_nextPage(
                  //   page: page,
                  //   clickPre: (){
                  //     page = page - 1;
                  //     SumrealizedBloc.of(context).add(InitGetSumrealizedEvent(page, 10));
                  //   },
                  //   clickNext: (){
                  //     page = page + 1;
                  //     SumrealizedBloc.of(context).add(InitGetSumrealizedEvent(page, 10));
                  //   },
                  // )
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
