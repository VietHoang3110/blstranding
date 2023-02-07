import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/bloc/home/home_bloc.dart';
import 'package:quan_ly/src/src_index.dart';
import 'package:quan_ly/widgets/widget/main_layout.dart';
import '../../src/spacing.dart';
import '../../storages/share_local.dart';
import '../widget_ui/widget_drawer.dart';
import '../widget_ui/widget_noti.dart';
import 'home/index.dart';


class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  @override
  void initState() {
    HomeBloc.of(context).add(InitGetHomeEvent());
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
        // appbarTitle: appLanguage['revise']!,
        appbarCenter: Image.asset(
          "assets/icons/logo.png",
          height: 30,
        ),
        appbarColor: Color(0xff115456),
        appbarAction: InkWell(
          onTap: () {
            AppNavigator.navigateNotification();
          },
          child: Stack(
            alignment: Alignment.center,
            children: const [
              Icon(
                Icons.notifications_none_sharp,
                size: 26,
                color: AppColors.white,
              ),
              widget_noti()
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if(state is UpdateGetHomeState){
                  return Column(
                    children: [
                      Dashboard44(homeWiget: state.data.homeWiget!),
                      InvestmentPortfolio(homeList: state.data.homeList!),
                      // const SetCommandBuySell(),
                      InforUserHomePage(homeInfo: state.data.homeInfo!,),
                      CommandToday(homeOrder: state.data.homeOrder!,),
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