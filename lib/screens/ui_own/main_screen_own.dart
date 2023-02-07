import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/bloc/home_own/home_own_bloc.dart';
import 'package:quan_ly/src/src_index.dart';
import 'package:quan_ly/widgets/widget/main_layout.dart';
import '../../src/spacing.dart';
import '../widget_ui/widget_drawer.dart';
import '../widget_ui/widget_noti.dart';
import 'home_own/index.dart';


class MainScreenOwn extends StatefulWidget {

  @override
  _MainScreenOwnState createState() => _MainScreenOwnState();
}

class _MainScreenOwnState extends State<MainScreenOwn> {


  @override
  void initState() {
      HomeOwnBloc.of(context).add(InitGetHomeOwnEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayout(
        drawer: const WidgetDrawer(),
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
        appbarColor: Color(0xff115456),
        // appbarTitle: appLanguage['revise']!,
        appbarCenter: Image.asset(
          "assets/icons/logo.png",
          height: 30,
        ),
        appbarAction: widget_noti(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: BlocBuilder<HomeOwnBloc, HomeOwnState>(
              builder: (context, state) {
                if(state is UpdateGetHomeOwnState){
                  return Column(
                    children: [
                      Dashboard44Own(homeWiget: state.data.homeWiget!),
                      InvestmentPortfolioOwn(homeList: state.data.homeList!),
                      // const SetCommandBuySellOwn(),
                      InforUserHomePageOwn(homeInfo: state.data.homeInfo!,),
                      // CommandTodayOwn(homeOrder: state.data.homeOrder!,),
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

