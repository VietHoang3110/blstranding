import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/bloc/trans/trans_bloc.dart';
import 'package:quan_ly/screens/widget_ui/widget_history.dart';
import 'package:quan_ly/widgets/widget/widget_header.dart';
import '../../../../src/src_index.dart';
import '../../../widget_ui/widget_card_home.dart';
import '../../../widget_ui/widget_drawer.dart';


class HistoryTransaction extends StatefulWidget {
  const HistoryTransaction({Key? key}) : super(key: key);

  @override
  State<HistoryTransaction> createState() => _HistoryTransactionState();
}

class _HistoryTransactionState extends State<HistoryTransaction> {
  int page =1;
  @override
  void initState() {
    TransBloc.of(context).add(InitGetTransEvent(page, 10));
    super.initState();
  }
  int indexList = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WidgetDrawer(),
      body: BlocBuilder<TransBloc, TransState>(
        builder: (context, state) {
          if(state is UpdateGetTransState){
            return Container(
              color: AppColors.bgGray,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).padding.top,
                    color: AppColors.white,
                  ),
                  const WidgetHeader(
                    title: 'Lịch sử giao dịch',
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
                                    Row(
                                      children: [
                                        WidgetHistory(
                                            icon: 'assets/icons/buy.svg',
                                            title: state.data.total![0].name ??"",
                                            value: (state.data.total![0].value ?? "").toString(),
                                            color: AppColors.bgblue
                                        ),
                                        WidgetHistory(
                                            icon: 'assets/icons/wallet.svg',
                                            title: state.data.total![1].name ??"",
                                            value: (state.data.total![1].value ?? "").toString(),
                                            color: AppColors.bggreen
                                        ),
                                        SizedBox(width: 16,)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        WidgetHistory(
                                            icon: 'assets/icons/sell.svg',
                                            title:  state.data.total![2].name ??"",
                                            value: (state.data.total![2].value ?? "").toString(),
                                            color: AppColors.bgorange),
                                        WidgetHistory(
                                            icon: 'assets/icons/totalSell.svg',
                                            title: state.data.total![3].name ??"",
                                            value: (state.data.total![3].value ?? "").toString(),
                                            color: AppColors.bgred),
                                        SizedBox(width: 16,)
                                      ],
                                    ),
                                  ],
                                ),
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
                                          label: SizedBox(
                                            width: AppValue.widths*0.2,
                                            child: Text(
                                              'Ngày giờ',
                                              textAlign: TextAlign.center,
                                              style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                            ),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Mã CK',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Số lượng mua',
                                            textAlign: TextAlign.right,
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Giá mua',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Thành tiền',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Số lượng bán',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Giá bán',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Thành tiền',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      // DataColumn(
                                      //     label: Text(
                                      //       'Tình trạng',
                                      //       style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                      //     )),
                                    ],
                                    rows:  List.generate(state.data.rows!.length,
                                            (indexList) => DataRow(
                                            color: MaterialStateProperty.resolveWith((states) =>
                                            indexList % 2 != 0 ? AppColors.greyE6 : AppColors.white),
                                            cells: [
                                              DataCell(Text((state.data.rows![indexList].date ?? '').toString())),

                                              DataCell(Align(alignment: Alignment.center,child:
                                                          Text((state.data.rows![indexList].code ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.center,child: Text((state.data.rows![indexList].buyAmount ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].intoMoney ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].moneyBuy ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].sellAmount ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].sellPrice ?? '').toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text((state.data.rows![indexList].provisional ?? '').toString()))),

                                              // DataCell(Text((state.data.rows![indexList].status ?? '').toString())),
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
                    maxPage: int.parse(state.data.maxPage!),
                    clickPre: (){
                      page = page - 1;
                      TransBloc.of(context).add(InitGetTransEvent(page, 10));
                    },
                    clickNext: (){
                      page = page + 1;
                      TransBloc.of(context).add(InitGetTransEvent(page, 10));
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
