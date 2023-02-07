import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quan_ly/bloc/contract_inv/contract_inv_bloc.dart';
import 'package:quan_ly/screens/widget_ui/widget_history.dart';
import 'package:quan_ly/widgets/widget/widget_header.dart';

import '../../../../src/src_index.dart';
import '../../../src/models/model_generator/contract_inv.dart';
import '../../widget_ui/widget_card_home.dart';
import '../../widget_ui/widget_drawer.dart';

class FinalizationContractInv extends StatefulWidget {
  const FinalizationContractInv({Key? key}) : super(key: key);

  @override
  State<FinalizationContractInv> createState() => _FinalizationContractInvState();
}

class _FinalizationContractInvState extends State<FinalizationContractInv> {
  int page =1;

  @override
  void initState() {
    ContractInvBloc.of(context).add(InitGetContractInvEvent(page, 10));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WidgetDrawer(),
      body: BlocBuilder<ContractInvBloc, ContractInvState>(
        builder: (context, state) {
          if(state is UpdateGetContractInvState){
            List<RowsInv>? rowsNew = state.data!.rows;
            rowsNew!.add(
                RowsInv(
                    numContract: "Tổng",
                    initialMoney: state.data!.totalMoney,
                    capitalContributionDate: '',
                    profitRate: '',
                    profitCalculationDate: '',
                    settlementDate: '',
                    profit: state.data!.totalProfit
                )
            );
            return Container(
              color: AppColors.bgGray,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).padding.top,
                    color: AppColors.white,
                  ),
                  const WidgetHeader(
                    title: 'Hợp đồng đã tất toán',
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
                                    WidgetHistory(
                                        icon: 'assets/icons/buy.svg',
                                        title: state.data!.total![0].name ??"",
                                        value: (state.data!.total![0].value ?? 0).toString(),
                                        color: AppColors.bgblue
                                    ),
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
                                    WidgetHistory(
                                        icon: 'assets/icons/totalSell.svg',
                                        title: state.data!.total![3].name ??"",
                                        value: (state.data!.total![3].value ?? 0).toString(),
                                        color: AppColors.bgred),
                                    SizedBox(width: 16,)
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
                                            textAlign: TextAlign.right,
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Tỷ suất lợi nhuận',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Số ngày tất toán',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Ngày tất toán',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                      DataColumn(
                                          label: Text(
                                            'Lợi nhuận tất toán',
                                            style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                                          )),
                                    ],
                                    rows: List.generate(rowsNew.length,
                                            (index) => DataRow(
                                            color: MaterialStateProperty.resolveWith((states) =>
                                            index % 2 != 0 ? AppColors.greyE6 : AppColors.white),
                                            cells: [
                                              DataCell(Text(rowsNew[index].numContract.toString(),
                                                  style: (index+1 == rowsNew.length) ? AppStyle.DEFAULT_14_BOLD : AppStyle.DEFAULT_14
                                              )),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text(rowsNew[index].initialMoney.toString(),
                                                      style: (index+1 == rowsNew.length) ? AppStyle.DEFAULT_14_BOLD : AppStyle.DEFAULT_14
                                                  ))),

                                              DataCell(Text(rowsNew[index].capitalContributionDate.toString())),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text(rowsNew[index].profitRate.toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text(rowsNew[index].profitCalculationDate.toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text(rowsNew[index].settlementDate.toString()))),

                                              DataCell(Align(alignment: Alignment.centerRight,
                                                  child: Text(rowsNew[index].profit.toString(),
                                                      style: (index+1 == rowsNew.length) ? AppStyle.DEFAULT_14_BOLD : AppStyle.DEFAULT_14
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
                          build_nextPage(
                            page: page,
                            maxPage: int.parse(state.data!.maxPage!),
                            clickPre: (){
                              page = page - 1;
                              ContractInvBloc.of(context).add(InitGetContractInvEvent(page, 10));
                            },
                            clickNext: (){
                              page = page + 1;
                              ContractInvBloc.of(context).add(InitGetContractInvEvent(page, 10));
                            },
                          )
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

class _builditem extends StatelessWidget {
  String numb;
  String text1;
  String text2;
  _builditem({
    Key? key,
    required this.numb,
    required this.text1,
    required this.text2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppValue.hSpaceSmall,
          Text(numb,style: AppStyle.DEFAULT_14,),
          AppValue.hSpaceMedium,
          SizedBox(
              width: AppValue.widths*0.65,
              child: Text(text1,style: AppStyle.DEFAULT_14,overflow: TextOverflow.ellipsis,)
          ),
          SizedBox(
              width: AppValue.widths*0.4,
              child: Text(text2,
                  style: AppStyle.DEFAULT_14,
                  overflow: TextOverflow.ellipsis,
              )
          )
        ],
      ),
    );
  }
}
