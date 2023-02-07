import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/bloc/info/info_bloc.dart';
import 'package:quan_ly/screens/widget_ui/widget_drawer.dart';
import 'package:quan_ly/src/src_index.dart';

import '../../src/color.dart';
import '../../src/styles.dart';
import '../../widgets/widget/main_layout.dart';
import '../../widgets/widget/widget_header.dart';
import '../../widgets/widget_text.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  void initState() {
    InfoBloc.of(context).add(InitGetInfoEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: WidgetDrawer(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            color: AppColors.white,
          ),
          const WidgetHeader(
            title: 'Về chúng tôi',
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: BlocBuilder<InfoBloc, InfoState>(
              builder: (context, state) {
                if(state is UpdateGetInfoState){
                  return SizedBox(
                    width: AppValue.widths,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        WidgetText(
                          title: state.data[0].title,
                          style: AppStyle.DEFAULT_20_BOLD.copyWith(
                              height: 2
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        WidgetText(
                          title: state.data[0].post,
                          style: AppStyle.DEFAULT_14.copyWith(
                              height: 2
                          ),
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                  );
                }else{
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
