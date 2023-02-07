import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../src/src_index.dart';


class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, -1)),
        ],
        color: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              setState(() {});
              activeBottomSheet = ActiveBottomSheet.home;
            },
            child: SvgPicture.asset(activeBottomSheet == ActiveBottomSheet.home
                ? "assets/icons/bottom_11.svg"
                : "assets/icons/bottom_1.svg"),
          ),
          InkWell(
            onTap: () {
              setState(() {});

              activeBottomSheet = ActiveBottomSheet.auditions;
            },
            child: SvgPicture.asset(
                activeBottomSheet == ActiveBottomSheet.auditions
                    ? "assets/icons/bottom_22.svg"
                    : "assets/icons/bottom_2.svg"),
          ),
          InkWell(
            onTap: () {
              setState(() {});

              activeBottomSheet = ActiveBottomSheet.notificate;
            },
            child: Stack(
              children: [
                SvgPicture.asset(
                    activeBottomSheet == ActiveBottomSheet.notificate
                        ? "assets/icons/bottom_33.svg"
                        : "assets/icons/bottom_3.svg"),
                Positioned(
                  right: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      width: 18,
                      height: 14,
                      color: AppColors.red,
                      child: const Center(
                        child: Text(
                          "5+",
                          style:
                              TextStyle(color: AppColors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {});

              activeBottomSheet = ActiveBottomSheet.profile;
            },
            child: SvgPicture.asset(
                activeBottomSheet == ActiveBottomSheet.profile
                    ? "assets/icons/bottom_44.svg"
                    : "assets/icons/bottom_4.svg"),
          ),
        ],
      ),
    );
  }
}
