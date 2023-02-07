import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../src/models/model_generator/home_inv.dart';
import '../../../src/models/model_generator/home_own.dart';
import '../../../src/src_index.dart';
import '../../widget_ui/widget_card_home.dart';


class Dashboard44Inv extends StatelessWidget {
  List<HomeInvWiget> homeWiget;
  Dashboard44Inv({
    Key? key,
    required this.homeWiget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 20,
        mainAxisSpacing: 22,
        childAspectRatio: 2,
        crossAxisCount: 2,
        children: <Widget>[
          CardHomePage44(
            svgPath: "assets/icons/ic_barchar.svg",
            title: homeWiget[0].name,
            value: homeWiget[0].value,
            ontap: () {},
          ),
          CardHomePage44(
            svgPath: "assets/icons/ic_chart_up.svg",
            backgroundColor: const Color(0xff27A844),
            footerColor: const Color(0xff24963E),
            title: homeWiget[1].name,
            value: homeWiget[1].value,
            ontap: () {},
          ),
          CardHomePage44(
            svgPath: "assets/icons/ic_dollaar.svg",
            backgroundColor: AppColors.orangefe,
            footerColor: AppColors.orange3,
            title: homeWiget[2].name,
            value: homeWiget[2].value,
            ontap: () {},
          ),
          CardHomePage44(
            svgPath: "assets/icons/ic_chart.svg",
            title: homeWiget[3].name,
            value: homeWiget[3].value,
            backgroundColor: const Color(0xffDD3437),
            footerColor: const Color(0xffC62F3E),
            ontap: () {},
          ),
        ],
      ),
    );
  }
}

