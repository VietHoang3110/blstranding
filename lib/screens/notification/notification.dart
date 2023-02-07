import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quan_ly/bloc/noti/noti_bloc.dart';
import 'package:quan_ly/bloc/read_noti/read_noti_bloc.dart';
import 'package:quan_ly/src/src_index.dart';
import 'package:quan_ly/widgets/widgets.dart';

import '../../src/color.dart';
import '../../src/spacing.dart';
import '../../widgets/widget/main_layout.dart';
import '../widget_ui/widget_card_home.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int page = 1;
  @override
  void initState() {
    NotiBloc.of(context).add(InitGetNotiEvent(page,10));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appbarColor: AppColors.white,
      appbarTitle: 'Thông báo',
      body: BlocBuilder<NotiBloc, NotiState>(
        builder: (context, state) {
          if(state is UpdateGetNotiState){
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: List.generate(state.data.dataTable!.length, (index) => InkWell(
                          onTap: () async {
                            ReadNotiBloc.of(context).add(ReadNotiSubmitted(id: state.data.dataTable![index].id.toString()));
                            AppNavigator.navigateDetailNoti(state.data.dataTable![index],page);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            color: (state.data.dataTable![index].status == "1") ? AppColors.greyE1 : AppColors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/iconNoti.svg'),
                                      AppValue.hSpace(10),
                                      Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              WidgetText(
                                                title: state.data.dataTable![index].name,
                                                style: AppStyle.DEFAULT_14,
                                                textOverflow: TextOverflow.ellipsis,
                                              ),
                                              AppValue.vSpace(5),
                                              WidgetText(
                                                title: state.data.dataTable![index].date,
                                                style: AppStyle.DEFAULT_12.copyWith(
                                                    color: const Color.fromRGBO(128, 128, 128, 1)
                                                ),
                                              ),
                                            ],
                                          )
                                      ),
                                      AppValue.hSpace(10),
                                      const Icon(Icons.chevron_right_sharp)
                                    ],
                                  ),
                                  AppValue.vSpace(5),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(height: 1,width: AppValue.widths*0.8,color: AppColors.greyE6,)
                                      ]
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
                build_nextPage(
                  page: page,
                  maxPage: int.parse(state.data.maxPage!),
                  clickPre: (){
                    page = page - 1;
                    NotiBloc.of(context).add(InitGetNotiEvent(page,10));
                  },
                  clickNext: (){
                    page = page + 1;
                    NotiBloc.of(context).add(InitGetNotiEvent(page,10));
                  },
                ),
                AppValue.vSpace(Spacing.viewPadding.bottom),
              ],
            );
          }
          else{
            return Container();
          }
        },
      )
    );
  }
}
