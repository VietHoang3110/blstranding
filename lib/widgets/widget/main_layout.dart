
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../src/src_index.dart';

class MainLayout extends StatefulWidget {
  const MainLayout(
      {Key? key,
      this.appbarLeading,
      this.bgrColor,
      this.body = const SizedBox(),
      this.appbarTitle,
      this.drawer,
      this.appbarColor,
      this.appbarAction,
      this.appbarCenter})
      : super(key: key);
  final String? appbarTitle;
  final Widget body;
  final Color? appbarColor;
  final Widget? appbarLeading, appbarAction, appbarCenter, drawer;
  final Color? bgrColor;
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widget.drawer,
      body: widget.body,
      backgroundColor: widget.bgrColor,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: widget.appbarColor,
        leading: widget.appbarLeading ??
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.black,
                size: 28,
              ),
            ),
        actions: widget.appbarAction != null
            ? [
                Container(
                  width: 50,
                  padding: const EdgeInsets.only(right: 15),
                  child: widget.appbarAction!,
                )
              ]
            : [
                const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.white,
                    size: 28,
                  ),
                ),
              ],
        title: Center(
          child: widget.appbarCenter ??
              Text(
                widget.appbarTitle ?? "",
                style: AppStyle.DEFAULT_16.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.black),
              ),
        ),
      ),
      // bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
