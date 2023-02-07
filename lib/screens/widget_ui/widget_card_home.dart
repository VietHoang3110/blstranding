import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../src/spacing.dart';
import '../../src/src_index.dart';
import '../../widgets/widgets.dart';

class CardHomePage44 extends StatelessWidget {
  const CardHomePage44({
    Key? key,
    this.svgPath,
    this.title,
    this.ontap,
    this.value,
    this.backgroundColor,
    this.footerColor,
  }) : super(key: key);
  final String? svgPath, title, value;
  final VoidCallback? ontap;
  final Color? backgroundColor, footerColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: backgroundColor ?? Color(0xff17A2B8)),
            width: size.width,
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  // padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    title ?? "",
                    style: AppStyle.DEFAULT_14.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.w500),
                  ),
                ),
                Center(
                  // padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    value ?? "",
                    style: AppStyle.DEFAULT_14.copyWith(
                        color: AppColors.white, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                    height: 1,
                    width: size.width,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(5),
                    //     color: footerColor ?? AppColors.green2
                    // ),
                    // child: Padding(
                    //   padding: const EdgeInsets.all(3),
                    //   child: SvgPicture.asset(
                    //     "assets/icons/ic_arrow.svg",
                    //     fit: BoxFit.fitHeight,
                    //   ),
                    // )
                )
              ],
            ),
          ),
          // Positioned(
          //   right: 15,
          //   child: SizedBox(
          //     height: 30,
          //     child: svgPath == null
          //         ? const SizedBox()
          //         : SvgPicture.asset(
          //             svgPath!,
          //             height: 30,
          //             width: 30,
          //             fit: BoxFit.fill,
          //           ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class InvestmentCard extends StatelessWidget {
  const InvestmentCard({
    Key? key,
    this.codeCK,
    this.total,
    this.priceTT,
    this.totalMoney,
    this.status,
    this.loinhuan
  }) : super(key: key);
  final String? codeCK, total, priceTT, totalMoney, status, loinhuan;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5)),
          height: 120,
          // margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text(
                        "Mã CK",
                        style: AppStyle.DEFAULT_14.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        codeCK ?? "CTR",
                        style: AppStyle.DEFAULT_14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text(
                        "GTTT",
                        style: AppStyle.DEFAULT_14.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        totalMoney ?? "247,500,000",
                        style: AppStyle.DEFAULT_14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      Text(
                        "Số lượng",
                        style: AppStyle.DEFAULT_14.copyWith(
                            color: AppColors.black, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        total ?? "3000000",
                        style: AppStyle.DEFAULT_14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      Text(
                        "% Lợi nhuận",
                        style: AppStyle.DEFAULT_14.copyWith(
                            color: AppColors.black, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        loinhuan ?? "3000000",
                        style: AppStyle.DEFAULT_14.copyWith(
                          color: (loinhuan![0] != '-') ? AppColors.green : AppColors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      Text(
                        "Giá TT",
                        style: AppStyle.DEFAULT_14.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        priceTT ?? "82.000",
                        style: AppStyle.DEFAULT_14
                      ),
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      Text(
                        'Tình trạng',
                        style: AppStyle.DEFAULT_14.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        status ?? "T2",
                        style: AppStyle.DEFAULT_14.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(color: Colors.black,height: 1,)
      ],
    );
  }
}

class RowInfor extends StatelessWidget {
  const RowInfor({
    Key? key,
    this.number,
    this.textCenterRight,
    this.textCenterLeft,
    this.suffixText,
    this.color,
  }) : super(key: key);
  final String? number, textCenterRight, textCenterLeft, suffixText;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: (int.parse(number!) % 2 == 0) ? AppColors.greyE6  : AppColors.white,
          padding: const EdgeInsets.fromLTRB(10, 12, 8, 12),
          // margin: const EdgeInsets.only(bottom: 3),
          //height: 40,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 8,
                child: Text( '$number. $textCenterLeft',
                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                ),
              ),
              AppValue.hSpace(5),
              Expanded(
                flex: 8,
                child: Text(textCenterRight ?? "1220%",
                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.right,
                ),
              ),
              suffixText == null ? const SizedBox() : Expanded(
                flex: 2,
                child:
                Container(
                  width: 60,
                  height: 22,
                  decoration: BoxDecoration(
                    color: color ?? AppColors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      "$suffixText",
                      style: const TextStyle(
                          fontSize: 10, color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class build_nextPage extends StatefulWidget {
  build_nextPage({
    Key? key,
    required this.clickNext,
    required this.clickPre,
    required this.page,
    this.maxPage

  }) : super(key: key);

  Function clickNext;
  Function clickPre;
  int page;
  int? maxPage;

  @override
  State<build_nextPage> createState() => _build_nextPageState();
}

class _build_nextPageState extends State<build_nextPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15,left: 15,bottom: Spacing.viewPadding.bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              setState(() {
                if(widget.page > 1){
                  widget.clickPre();
                }
              });
            },
            child: SizedBox(
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.keyboard_double_arrow_left,color: (widget.page > 1)? AppColors.black: AppColors.grey,),
                    AppValue.hSpaceTiny,
                    WidgetText(
                      title: 'Trước',
                      style: AppStyle.DEFAULT_14.copyWith(
                        color: (widget.page > 1)? AppColors.black: AppColors.grey
                      ),
                    )
                  ],
                )
            ),
          ),
          WidgetText(
            title: 'Trang: ${widget.page}',
            style: AppStyle.DEFAULT_14,
          ),
          InkWell(
            onTap: (){
              setState(() {
                if(widget.page < widget.maxPage!){
                  widget.clickNext();
                }
              });
            },
            child: SizedBox(
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WidgetText(
                      title: 'Sau',
                      style: AppStyle.DEFAULT_14.copyWith(
                          color: (widget.page < widget.maxPage!)? AppColors.black: AppColors.grey
                      ),
                    ),
                    AppValue.hSpaceTiny,
                    Icon(Icons.keyboard_double_arrow_right, color: (widget.page < widget.maxPage!)? AppColors.black: AppColors.grey),
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}