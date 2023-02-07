import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/bloc/money/money_bloc.dart';
import 'package:quan_ly/widgets/widget/widget_header.dart';

import '../../../../src/models/model_generator/money.dart';
import '../../../../src/src_index.dart';
import '../../../widget_ui/widget_card_home.dart';
import '../../../widget_ui/widget_drawer.dart';
import '../../../widget_ui/widget_history.dart';

class HistoryDeposit extends StatefulWidget {
  const HistoryDeposit({Key? key}) : super(key: key);

  @override
  State<HistoryDeposit> createState() => _HistoryDepositState();
}

class _HistoryDepositState extends State<HistoryDeposit> {
  int page = 1;
  @override
  void initState() {
    MoneyBloc.of(context).add(InitGetMoneyEvent(page, 10));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: WidgetDrawer(),
      body: BlocBuilder<MoneyBloc, MoneyState>(
        builder: (context, state) {
          if(state is UpdateGetMoneyState){
            List<RowsMoney>? rowsNew = state.data!.rows;
            rowsNew!.add(
                RowsMoney(
                    id: "Tổng",
                    date: '',
                    description: '',
                    cashIn: (state.data!.total![0].value ??"").toString(),
                    cashOut: (state.data!.total![1].value ??"").toString(),
                )
            );
            return Column(
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
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  WidgetHistory(
                                      icon: 'assets/icons/buy.svg',
                                      title: state.data!.total![0].name ??"",
                                      value: (state.data!.total![0].value ??"").toString(),
                                      color: AppColors.bgblue
                                  ),
                                  WidgetHistory(
                                      icon: 'assets/icons/wallet.svg',
                                      title: state.data!.total![1].name ??"",
                                      value: (state.data!.total![1].value ??"").toString(),
                                      color: AppColors.bggreen
                                  ),
                                  SizedBox(width: 16,)
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
                                              width: AppValue.widths*0.75,
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
                                      rows: List.generate(rowsNew.length,
                                              (index) => DataRow(
                                              color: MaterialStateProperty.resolveWith((states) =>
                                              index % 2 != 0 ? AppColors.greyE6 : AppColors.white),
                                              cells: [
                                                DataCell(Text((rowsNew[index].id ?? "").toString(),
                                                    style: (index==(rowsNew.length - 1)) ? AppStyle.DEFAULT_16_BOLD : AppStyle.DEFAULT_14
                                                )),

                                                DataCell(Text((rowsNew[index].date ?? "").toString())),

                                                DataCell(Text((rowsNew[index].description ?? "").toString())),

                                                DataCell(Align(alignment: Alignment.centerRight,
                                                    child: Text((rowsNew[index].cashIn ?? "").toString(),
                                                        style: (index==(rowsNew.length - 1)) ? AppStyle.DEFAULT_16_BOLD : AppStyle.DEFAULT_14
                                                    ))),

                                                DataCell(Align(alignment: Alignment.centerRight,
                                                    child: Text((rowsNew[index].cashOut ?? "").toString(),
                                                        style: (index==(rowsNew.length - 1)) ? AppStyle.DEFAULT_16_BOLD : AppStyle.DEFAULT_14
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
                  ),
                ),
                build_nextPage(
                  page: page,
                  maxPage: int.parse(state.data!.maxPage!),
                  clickPre: (){
                    page = page - 1;
                    MoneyBloc.of(context).add(InitGetMoneyEvent(page, 10));
                  },
                  clickNext: (){
                    page = page + 1;
                    MoneyBloc.of(context).add(InitGetMoneyEvent(page, 10));
                  },
                )
              ],
            );
          }else{
            return Container();
          }
        },
      ),
    );
  }

}
