import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/src/src_index.dart';
import 'package:quan_ly/widgets/widget/main_layout.dart';
import '../../bloc/home_inv/home_inv_bloc.dart';
import '../../src/spacing.dart';
import '../widget_ui/widget_card_home.dart';
import '../widget_ui/widget_drawer.dart';
import '../widget_ui/widget_noti.dart';
import 'home_inv/index.dart';


class MainScreenInv extends StatefulWidget {

  @override
  _MainScreenInvState createState() => _MainScreenInvState();
}

class _MainScreenInvState extends State<MainScreenInv> {
  int page =1 ;

  @override
  void initState() {
    HomeInvBloc.of(context).add(InitGetHomeInvEvent(page,10));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        drawer: const WidgetDrawer(),
        appbarColor: Color(0xff115456),
        appbarLeading: Builder(builder: (context) {
          return InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(
              Icons.menu,
              color: AppColors.white,
            ),
          );
        }),
        // appbarTitle: appLanguage['revise']!,
        appbarCenter: Image.asset(
          "assets/icons/logo.png",
          height: 30,
        ),
        appbarAction: widget_noti(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: BlocBuilder<HomeInvBloc, HomeInvState>(
              builder: (context, state) {
                if(state is UpdateGetHomeInvState){
                  return Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Dashboard44Inv(homeWiget: state.data.homeWiget!)),
                      Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: InvestmentPortfolioInv(homeList: state.data.homeList!, data: state.data,)),
                      AppValue.vSpaceTiny,
                      build_nextPage(
                        page: page,
                        maxPage: int.parse(state.data.maxPage!),
                        clickPre: (){
                          page = page - 1;
                          HomeInvBloc.of(context).add(InitGetHomeInvEvent(page,10));
                        },
                        clickNext: (){
                          page = page + 1;
                          HomeInvBloc.of(context).add(InitGetHomeInvEvent(page,10));
                        },
                      ),
                      SizedBox(
                        height: Spacing.viewPadding.bottom,
                      )
                    ],
                  );
                }
                else{
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

}

