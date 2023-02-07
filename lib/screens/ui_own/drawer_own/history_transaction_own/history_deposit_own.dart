import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/bloc/money_own/money_own_bloc.dart';
import 'package:quan_ly/screens/widget_ui/widget_history.dart';
import 'package:quan_ly/widgets/widget/widget_header.dart';

import '../../../../src/src_index.dart';
import '../../../widget_ui/widget_card_home.dart';
import '../../../widget_ui/widget_drawer.dart';

class HistoryDepositOwn extends StatefulWidget {
  const HistoryDepositOwn({Key? key}) : super(key: key);

  @override
  State<HistoryDepositOwn> createState() => _HistoryDepositOwnState();
}

class _HistoryDepositOwnState extends State<HistoryDepositOwn> {

  late int page = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    MoneyOwnBloc.of(context).add(InitGetMoneyOwnEvent(page, 10));
    // _scrollController.addListener(() async {
    //   if (_scrollController.offset ==
    //       _scrollController.position.maxScrollExtent) {
    //     MoneyOwnBloc.of(context).add(InitGetMoneyOwnEvent(page+1, 20));
    //     page=page+1;
    //   } else {}
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WidgetDrawer(),
      body: BlocBuilder<MoneyOwnBloc, MoneyOwnState>(
        builder: (context, state) {
          if(state is UpdateGetMoneyOwnState){
            return Container(
              color: AppColors.bgGray,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).padding.top,
                    color: AppColors.white,
                  ),
                  const WidgetHeader(
                    title: 'Giao dịch tiền',
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                // Column(
                                //   children: [
                                    Row(
                                      children: [
                                        // WidgetHistory(
                                        //     icon: 'assets/icons/buy.svg',
                                        //     title: state.data!.total![0].name ??"",
                                        //     value: (state.data!.total![0].value ?? 0).toString(),
                                        //     color: AppColors.bgblue
                                        // ),
                                        WidgetHistory(
                                            icon: 'assets/icons/wallet.svg',
                                            title: state.data!.total![1].name ??"",
                                            value: (state.data!.total![1].value ?? 0).toString(),
                                            color: AppColors.bggreen
                                        ),
                                        SizedBox(width: 16,)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        WidgetHistory(
                                            icon: 'assets/icons/sell.svg',
                                            title:  state.data!.total![2].name ??"",
                                            value: (state.data!.total![2].value ?? 0).toString(),
                                            color: AppColors.bgorange),
                                        // WidgetHistory(
                                        //     icon: 'assets/icons/totalSell.svg',
                                        //     title: state.data!.total![3].name ??"",
                                        //     value: (state.data!.total![3].value ?? 0).toString(),
                                        //     color: AppColors.bgred),
                                        SizedBox(width: 16,)
                                      ],
                                    ),
                                //   ],
                                // ),
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
                                            'STT',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Ngày giao dịch',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: SizedBox(
                                            width: AppValue.widths*0.7,
                                            child: Text(
                                              'Diễn giải',
                                              textAlign: TextAlign.center,
                                              style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                            ),
                                          )),
                                      DataColumn(
                                          label: SizedBox(
                                            width: AppValue.widths*0.25,
                                            child: Text(
                                              'Nộp',
                                              textAlign: TextAlign.center,
                                              style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                            ),
                                          )),
                                      DataColumn(
                                          label: SizedBox(
                                            width: AppValue.widths*0.25,
                                            child: Text(
                                              'Rút',
                                              textAlign: TextAlign.center,
                                              style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                            ),
                                          )),
                                    ],
                                    rows: List.generate(state.data!.datatable!.length,
                                            (index) => DataRow(
                                            color: MaterialStateProperty.resolveWith((states) =>
                                            index % 2 != 0 ? AppColors.greyE6 : AppColors.white),
                                            cells: [
                                              DataCell(Text(state.data!.datatable![index].id.toString())),
                                              DataCell(Text(state.data!.datatable![index].date.toString())),
                                              DataCell(Text(state.data!.datatable![index].description.toString())),
                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text(state.data!.datatable![index].cashIn.toString()))),
                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text(state.data!.datatable![index].cashOut.toString()))),
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
                  build_nextPage(
                    page: page,
                    maxPage: int.parse(state.data!.maxPage!),
                    clickPre: (){
                      page = page - 1;
                      MoneyOwnBloc.of(context).add(InitGetMoneyOwnEvent(page, 10));
                    },
                    clickNext: (){
                      page = page + 1;
                      MoneyOwnBloc.of(context).add(InitGetMoneyOwnEvent(page, 10));
                    },
                  )
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
