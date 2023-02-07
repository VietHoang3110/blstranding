import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/widgets/widget/widget_header.dart';
import 'package:quan_ly/widgets/widgets.dart';
import '../../../../bloc/trans_own/trans_own_bloc.dart';
import '../../../../src/spacing.dart';
import '../../../../src/src_index.dart';
import '../../../widget_ui/widget_card_home.dart';
import '../../../widget_ui/widget_drawer.dart';
import '../../../widget_ui/widget_history.dart';


class HistoryTransactionOwn extends StatefulWidget {
  const HistoryTransactionOwn({Key? key}) : super(key: key);

  @override
  State<HistoryTransactionOwn> createState() => _HistoryTransactionOwnState();
}

class _HistoryTransactionOwnState extends State<HistoryTransactionOwn> {

  int page = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    TransOwnBloc.of(context).add(InitGetTransOwnEvent(page,10));
    // _scrollController.addListener(() async {
    //   if (_scrollController.offset ==
    //       _scrollController.position.maxScrollExtent) {
    //     TransOwnBloc.of(context).add(InitGetTransOwnEvent(page+1, 20));
    //     page=page+1;
    //   } else {}
    // });
    super.initState();
  }

  int indexList = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WidgetDrawer(),
      body: BlocBuilder<TransOwnBloc, TransOwnState>(
        builder: (context, state) {
          if(state is UpdateGetTransOwnState){
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
                      controller: _scrollController,
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
                                            value: (state.data.total![0].value ?? 0).toString(),
                                            color: AppColors.bgblue
                                        ),
                                        WidgetHistory(
                                            icon: 'assets/icons/wallet.svg',
                                            title: state.data.total![1].name ??"",
                                            value: (state.data.total![1].value ?? 0).toString(),
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
                                            value: (state.data.total![2].value ?? 0).toString(),
                                            color: AppColors.bgorange),
                                        WidgetHistory(
                                            icon: 'assets/icons/totalSell.svg',
                                            title: state.data.total![3].name ??"",
                                            value: (state.data.total![3].value ?? 0).toString(),
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
                                  buildTable(state),
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
                        TransOwnBloc.of(context).add(InitGetTransOwnEvent(page,10));
                    },
                    clickNext: (){
                        page = page + 1;
                        TransOwnBloc.of(context).add(InitGetTransOwnEvent(page,10));
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

  buildTable(UpdateGetTransOwnState state) {
    return Container(
      color: AppColors.white,
      child: DataTable(
        showBottomBorder: true,
    sortColumnIndex: 1,
    border: TableBorder.all(width: 1, color: AppColors.bgGray),
    columns: [
      DataColumn(
          label: SizedBox(
            width: AppValue.widths*0.2,
            child: Text(
              'Ngày giờ',
              style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          )),
      DataColumn(
          label: Text(
            'Mã CK',
            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
          )),
      DataColumn(
          label: Text(
            'SL mua',
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
            'SL bán',
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
    rows:  List.generate(state.data.dataTable!.length,
            (indexList) => DataRow(
            color: MaterialStateProperty.resolveWith((states) =>
            indexList % 2 != 0 ? AppColors.greyE6 : AppColors.white),
            cells: [
              DataCell(Text((state.data.dataTable![indexList].date ?? '').toString())),

              DataCell(Text((state.data.dataTable![indexList].code ?? '').toString())),

              DataCell(Align(alignment: Alignment.centerRight,
                  child: Text((state.data.dataTable![indexList].buyQuantity ?? '').toString()))),

              DataCell(Align(alignment: Alignment.centerRight,
                  child: Text((state.data.dataTable![indexList].buyPrice ?? '').toString()))),

              DataCell(Align(alignment: Alignment.centerRight,
                  child: Text((state.data.dataTable![indexList].buyTotal ?? '').toString()))),

              DataCell(Align(alignment: Alignment.centerRight,
                  child: Text((state.data.dataTable![indexList].sellQuantity ?? '').toString()))),

              DataCell(Align(alignment: Alignment.centerRight,
                  child: Text((state.data.dataTable![indexList].sellPrice ?? '').toString()))),

              DataCell(Align(alignment: Alignment.centerRight,
                  child: Text((state.data.dataTable![indexList].sellTotal ?? '').toString()))),

              // DataCell(Text((state.data.dataTable![indexList].status ?? '').toString())),
            ])),
  ));
  }

  // buildTableNew(UpdateGetTransOwnState state) {
  //   return Container(
  //       color: AppColors.white,
  //       child:  HorizontalDataTable(
  //         leftHandSideColumnWidth: 100,
  //         rightHandSideColumnWidth: 600,
  //         isFixedHeader: true,
  //         headerWidgets: [
  //           Text(
  //             'Ngày giờ',
  //             style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
  //           )
  //         ],
  //         leftSideItemBuilder: _generateFirstColumnRow,
  //         rightSideItemBuilder: _generateRightHandSideColumnRow,
  //         itemCount: state.dataTable.length,
  //         rowSeparatorWidget: const Divider(
  //           color: Colors.black54,
  //           height: 1.0,
  //           thickness: 0.0,
  //         ),
  //         leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
  //         rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
  //       ),
  //   );
  // }
}


