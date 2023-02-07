import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../src/color.dart';
import '../../src/src_index.dart';
import '../../widgets/widget/main_layout.dart';
import '../../widgets/widget_text.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}



class _LanguagePageState extends State<LanguagePage> {
  int indexLanguage = 0;
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appbarColor: AppColors.white,
      appbarTitle: 'Thay đổi ngôn ngữ',
      body: Column(
        children: [
          WidgetButtonCategory3(
            image: 'assets/icons/vietnam.svg',
            title: 'Tiếng Việt',
            index: 1,
            select: indexLanguage,
            onClick: () {
              setState(() {
                indexLanguage = 1;
              });
            },
          ),
          WidgetButtonCategory3(
            image: 'assets/icons/united-kingdom.svg',
            title: 'English',
            index: 2,
            select: indexLanguage,
            onClick: () {
              setState(() {
                indexLanguage = 2;
              });
            },
          )
        ],
      ),
    );
  }
}

class WidgetButtonCategory3 extends StatefulWidget {
  final String? image;
  final String? title;
  final Function onClick;
  final int index;
  final int select;
  const WidgetButtonCategory3({
    Key? key,
    required this.image,
    required this.title,
    required this.onClick,
    required this.index,
    required this.select
  }) : super(key: key);

  @override
  _WidgetButtonCategory3State createState() => _WidgetButtonCategory3State();
}

class _WidgetButtonCategory3State extends State<WidgetButtonCategory3> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateColor.resolveWith((states) => AppColors.white),
      onTap: ()=>widget.onClick(),
      child: Column(
        children: [
          AppValue.vSpaceTiny,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: SvgPicture.asset("${widget.image}",
                          height: 28,
                          width: 28,
                          fit: BoxFit.contain
                      ),
                    ),
                    AppValue.hSpaceSmall,
                    WidgetText(
                      title: widget.title,
                      style: AppStyle.DEFAULT_16,
                    ),
                  ],
                ),
                widget.index==widget.select
                    ? SvgPicture.asset('assets/icons/on.svg')
                    : SvgPicture.asset('assets/icons/off.svg')
              ],
            ),
          ),
          AppValue.vSpaceSmall,
          Padding(
            padding: const EdgeInsets.only(left: 55),
            child: Container(height: 1,width: AppValue.heights,color: AppColors.greyE6,),
          )
        ],
      ),
    );
  }
}

