import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/bloc/noti/noti_bloc.dart';
import '../../bloc/home_inv/home_inv_bloc.dart';
import '../../src/color.dart';
import '../../src/src_index.dart';


class widget_noti extends StatefulWidget {
  const widget_noti({
    Key? key,
  }) : super(key: key);

  @override
  State<widget_noti> createState() => _widget_notiState();
}

class _widget_notiState extends State<widget_noti> {

  String _now = "1";
  // Timer _everySecond = 10;


  @override
  void initState() {
    NotiBloc.of(context).add(InitGetNotiEvent(1,10));
    // _now = DateTime.now().second.toString();
    //
    // // defines a timer
    // Timer _everySecond = Timer.periodic(Duration(seconds: 120), (Timer t) {
    //   setState(() {
    //     _now = DateTime.now().second.toString();
    //     NotiBloc.of(context).add(InitGetNotiEvent());
    //     HomeInvBloc.of(context).add(InitGetHomeInvEvent());
    //   });
    // });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.navigateNotification();
      },
      child: Center(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            const Icon(
              Icons.notifications_none_sharp,
              size: 26,
              color: AppColors.white,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BlocBuilder<NotiBloc, NotiState>(
                builder: (context, state) {
                  if(state is UpdateGetNotiState){
                    int count = state.data.unreadCount!;
                    return (count == 0) ? const SizedBox(width: 16,height: 16,) : Container(
                      width: 16,
                      height: 16,
                      color: AppColors.red,
                      child:  Center(
                        child: Text(
                            (count > 9) ? '9+' : count.toString(),
                          style: const TextStyle(
                              color: AppColors.white, fontSize: 10),
                        ),
                      ),
                    );
                  }
                  else{
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}