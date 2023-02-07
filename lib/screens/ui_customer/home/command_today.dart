import 'package:flutter/material.dart';

import '../../../src/models/model_generator/home.dart';
import '../../../src/src_index.dart';

class CommandToday extends StatelessWidget {
  List<HomeOrder>? homeOrder;
  CommandToday({
    Key? key,
    this.homeOrder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Lệnh hôm nay',
              style: AppStyle.DEFAULT_16_BOLD,
            ),
            // Text(
            //   "Xem thêm",
            //   style: AppStyle.DEFAULT_14.copyWith(
            //       decoration: TextDecoration.underline, color: AppColors.grey),
            // ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Table(
        //     border: TableBorder.all(
        //       color: AppColors.white,
        //       width: 2,
        //     ),
        //     columnWidths: const <int, TableColumnWidth>{
        //       0: IntrinsicColumnWidth(),
        //       1: IntrinsicColumnWidth(),
        //       2: IntrinsicColumnWidth(),
        //       3: IntrinsicColumnWidth(),
        //       4: IntrinsicColumnWidth(),
        //       5: IntrinsicColumnWidth(),
        //       6: IntrinsicColumnWidth(),
        //       // 7: IntrinsicColumnWidth(),
        //       // 8: IntrinsicColumnWidth(),
        //       // 9: IntrinsicColumnWidth(),
        //     },
        //     defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        //     children: <TableRow>[
        //       TableRow(
        //         children: <Widget>[
        //           Container(
        //             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        //             color: AppColors.blue2,
        //             child: Text(
        //               'Mã CK',
        //               style: AppStyle.DEFAULT_12.copyWith(
        //                 color: AppColors.white,
        //               ),
        //             ),
        //           ),
        //           Container(
        //             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        //             color: AppColors.blue2,
        //             child: Text(
        //               'Loại GD',
        //               style: AppStyle.DEFAULT_12.copyWith(
        //                 color: AppColors.white,
        //               ),
        //             ),
        //           ),
        //           // Container(
        //           //   padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        //           //   color: AppColors.blue2,
        //           //   child: Text(
        //           //     'Số lượng',
        //           //     style: AppStyle.DEFAULT_12.copyWith(
        //           //       color: AppColors.white,
        //           //     ),
        //           //   ),
        //           // ),
        //           // Container(
        //           //   padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        //           //   color: AppColors.blue2,
        //           //   child: Text(
        //           //     'Giá',
        //           //     style: AppStyle.DEFAULT_12.copyWith(
        //           //       color: AppColors.white,
        //           //     ),
        //           //   ),
        //           // ),
        //           // Container(
        //           //   padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        //           //   color: AppColors.blue2,
        //           //   child: Text(
        //           //     'Tình trạng',
        //           //     style: AppStyle.DEFAULT_12.copyWith(
        //           //       color: AppColors.white,
        //           //     ),
        //           //   ),
        //           // ),
        //           Container(
        //             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        //             color: AppColors.blue2,
        //             child: Text(
        //               'Giờ đặt',
        //               style: AppStyle.DEFAULT_12.copyWith(
        //                 color: AppColors.white,
        //               ),
        //             ),
        //           ),
        //           Container(
        //             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        //             color: AppColors.blue2,
        //             child: Text(
        //               'Số lượng khớp',
        //               style: AppStyle.DEFAULT_12.copyWith(
        //                 color: AppColors.white,
        //               ),
        //             ),
        //           ),
        //           Container(
        //             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        //             color: AppColors.blue2,
        //             child: Text(
        //               'Giá khớp',
        //               style: AppStyle.DEFAULT_12.copyWith(
        //                 color: AppColors.white,
        //               ),
        //             ),
        //           ),
        //           Container(
        //             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        //             color: AppColors.blue2,
        //             child: Text(
        //               'Thành tiền',
        //               style: AppStyle.DEFAULT_12.copyWith(
        //                 color: AppColors.white,
        //               ),
        //             ),
        //           ),
        //           Container(
        //             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        //             color: AppColors.blue2,
        //             child: Text(
        //               'Còn lại',
        //               style: AppStyle.DEFAULT_12.copyWith(
        //                 color: AppColors.white,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //       ...homeOrder!.map(
        //         (e) => dataTableRow(
        //           codeck: e.mack,
        //           typetransfer: e.giaodich,
        //           // count: e.soLuong,
        //           // price: e.gia,
        //           // status: e.tinhtrang,
        //           timeorder: e.giodat,
        //           numberofjoin: e.slKhop,
        //           priceofjoin: e.giaKhop,
        //           totalMoney: e.giatrikhop,
        //           remainingprice: e.conlai,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    color: AppColors.white, child: DataTable(
                  border: TableBorder.all(width: 1, color: AppColors.bgGray),
                  columns: [
                    DataColumn(
                        label: Text(
                          'Mã CK',
                          textAlign: TextAlign.center,
                          style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                        )),
                    DataColumn(
                        label: Text(
                          'Loại GD',
                          style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                        )),
                    DataColumn(
                        label: Text(
                          'Giờ đặt',
                          textAlign: TextAlign.right,
                          style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                        )),
                    DataColumn(
                        label: Text(
                          'Số lượng khớp',
                          style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                        )),
                    DataColumn(
                        label: Text(
                          'Giá khớp',
                          style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                        )),
                    DataColumn(
                        label: Text(
                          'Thành tiền',
                          style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                        )),
                    DataColumn(
                        label: Text(
                          'Còn lại',
                          style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                        )),
                    // DataColumn(
                    //     label: Text(
                    //       'Tình trạng',
                    //       style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                    //     )),
                  ],
                  rows:  List.generate(homeOrder!.length,
                          (indexList) => DataRow(
                          color: MaterialStateProperty.resolveWith((states) =>
                          indexList % 2 != 0 ? AppColors.greyE6 : AppColors.white),
                          cells: [
                            DataCell(Text((homeOrder![indexList].mack ?? '').toString())),

                            DataCell(Align(alignment: Alignment.center,child:
                            Text((homeOrder![indexList].giaodich ?? '').toString()))),

                            DataCell(Align(alignment: Alignment.center,
                                child: Text((homeOrder![indexList].giodat ?? '').toString()))),

                            DataCell(Align(alignment: Alignment.centerRight,
                                child: Text((homeOrder![indexList].slKhop ?? '').toString()))),

                            DataCell(Align(alignment: Alignment.centerRight,
                                child: Text((homeOrder![indexList].giaKhop ?? '').toString()))),

                            DataCell(Align(alignment: Alignment.centerRight,
                                child: Text((homeOrder![indexList].giatrikhop ?? '').toString()))),

                            DataCell(Align(alignment: Alignment.centerRight,
                                child: Text((homeOrder![indexList].conlai ?? '').toString()))),

                            // DataCell(Text((state.data.rows![indexList].status ?? '').toString())),
                          ])),
                )),
                Container(
                  width: 16,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  TableRow dataTableRow({
    String? codeck = "",
    String? typetransfer = "",
    // String? count = "",
    // String? price = "",
    // String? status = "",
    String? timeorder = "",
    String? numberofjoin = "",
    String? priceofjoin = "",
    String? totalMoney = "",
    String? remainingprice = "",
  }) {
    return TableRow(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          color: AppColors.blue2,
          child: Text(
            codeck ?? "codeck",
            style: AppStyle.DEFAULT_12.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          color: AppColors.blue2,
          child: Text(
            typetransfer ?? 'typetransfer',
            style: AppStyle.DEFAULT_12.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        // Container(
        //   padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        //   color: AppColors.blue2,
        //   child: Text(
        //     count ?? 'count',
        //     style: AppStyle.DEFAULT_12.copyWith(
        //       color: AppColors.white,
        //     ),
        //     textAlign: TextAlign.right,
        //   ),
        // ),
        // Container(
        //   padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        //   color: AppColors.blue2,
        //   child: Text(
        //     price ?? "",
        //     style: AppStyle.DEFAULT_12.copyWith(
        //       color: AppColors.white,
        //     ),
        //     textAlign: TextAlign.right,
        //   ),
        // ),
        // Container(
        //   padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        //   color: AppColors.blue2,
        //   child: Text(
        //     status ?? 'status',
        //     style: AppStyle.DEFAULT_12.copyWith(
        //       color: AppColors.white,
        //     ),
        //   ),
        // ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          color: AppColors.blue2,
          child: Text(
            timeorder ?? 'timeorder',
            style: AppStyle.DEFAULT_12.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          color: AppColors.blue2,
          child: Text(
            numberofjoin ?? 'numberofjoin',
            style: AppStyle.DEFAULT_12.copyWith(
              color: AppColors.white,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          color: AppColors.blue2,
          child: Text(
            priceofjoin ?? 'priceofjoin',
            style: AppStyle.DEFAULT_12.copyWith(
              color: AppColors.white,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          color: AppColors.blue2,
          child: Text(
            totalMoney ?? 'vtotalMoney',
            style: AppStyle.DEFAULT_12.copyWith(
              color: AppColors.white,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          color: AppColors.blue2,
          child: Text(
            remainingprice ?? 'remainingprice',
            style: AppStyle.DEFAULT_12.copyWith(
              color: AppColors.white,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
