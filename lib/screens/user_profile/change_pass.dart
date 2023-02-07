import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quan_ly/bloc/change_pass/change_pass_bloc.dart';

import '../../src/src_index.dart';
import '../../widgets/widget/main_layout.dart';
import '../../widgets/widget/widget_button.dart';
import '../../widgets/widget/widget_input.dart';
import '../../widgets/widget_dialog.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({Key? key}) : super(key: key);

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {

  final TextEditingController _oldPassController = TextEditingController();
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _conPassController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePassBloc, ChangePassState>(
      listener: (context, state) {
        if (state is SuccessChangePassState) {
          GetSnackBarUtils.removeSnackBar();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WidgetDialog(
                  title: MESSAGES.NOTIFICATION,
                  content: MESSAGES.SUCCESS,
                  onTap1: (){
                    Get.back();
                    Get.back();
                  }
              );
            },
          );
        }
        if (state is InProgressChangePassState) {
          GetSnackBarUtils.createProgress();
        }
        if (state is FailureChangePassState) {
          GetSnackBarUtils.removeSnackBar();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return WidgetDialog(
                title: MESSAGES.NOTIFICATION,
                content: state.message,
              );
            },
          );
        }
      },
      child: MainLayout(
        appbarColor: AppColors.white,
        appbarTitle: 'Đổi mật khẩu',
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15),
                width: AppValue.widths,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: AppColors.greyE1))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: AppValue.widths * 0.3,
                            child: Text(
                              'Mật khẩu cũ:',
                              style: AppStyle.DEFAULT_14
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Expanded(
                            child: WidgetInput(
                              hintText: "",
                              isPassword: true,
                              controller: _oldPassController,
                              inputBorder: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: AppColors.greyE1))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: AppValue.widths * 0.3,
                            child: Text(
                              'Mật khẩu mới:',
                              style: AppStyle.DEFAULT_14
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Expanded(
                            child: WidgetInput(
                              hintText: "",
                              controller: _newPassController,
                              isPassword: true,
                              inputBorder: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: AppColors.greyE1))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: AppValue.widths * 0.3,
                            child: Text(
                              'Nhập lại mật khẩu:',
                              style: AppStyle.DEFAULT_14
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Expanded(
                            child: WidgetInput(
                              hintText: "",
                              controller: _conPassController,
                              isPassword: true,
                              inputBorder: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
              // color: AppColors.greyE5,
              child: Center(
                child: WidgetButton(
                  isPrimaryButton: true,
                  ontap: () {
                    ChangePassBloc.of(context).add(ChangePassSubmitted(_oldPassController.text, _newPassController.text, _conPassController.text));
                  },
                  text: 'Cập nhật',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
