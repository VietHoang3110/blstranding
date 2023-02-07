import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/bloc/proviso/proviso_bloc.dart';
import 'package:quan_ly/screens/widget_ui/widget_drawer.dart';
import 'package:quan_ly/src/src_index.dart';
import 'package:quan_ly/widgets/widget_text.dart';

import '../../src/color.dart';
import '../../widgets/widget/main_layout.dart';
import '../../widgets/widget/widget_header.dart';

class RulesPage extends StatefulWidget {
  const RulesPage({Key? key}) : super(key: key);

  @override
  State<RulesPage> createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {

  @override
  void initState() {
    ProvisoBloc.of(context).add(InitGetProvisoEvent());
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
            title: 'Điều khoản và chính sách',
          ),
          BlocBuilder<ProvisoBloc, ProvisoState>(
            builder: (context, state) {
              if(state is UpdateGetProvisoState){
                return SizedBox(
                  width: AppValue.widths,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        WidgetText(
                          title: state.data.name,
                          style: AppStyle.DEFAULT_20_BOLD.copyWith(
                              height: 2
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        AppValue.vSpaceSmall,
                        WidgetText(
                          title: state.data.title,
                          style: AppStyle.DEFAULT_14.copyWith(
                              height: 2
                          ),
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                  ),
                );
              }else{
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
