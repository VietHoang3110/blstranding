
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quan_ly/bloc/change_profile/change_profile_bloc.dart';
import 'package:quan_ly/bloc/change_profile_noAvt/change_profile_noAvt_bloc.dart';
import 'package:quan_ly/widgets/widget/main_layout.dart';
import 'package:quan_ly/widgets/widget/widget_button.dart';
import 'package:quan_ly/widgets/widget_text.dart';
import '../../bloc/get_profile/get_profile_bloc.dart';
import '../../bloc/get_profile_inv/get_profile_inv_bloc.dart';
import '../../bloc/get_profile_own/get_profile_own_bloc.dart';
import '../../src/models/model_generator/profile.dart';
import '../../src/spacing.dart';
import '../../src/src_index.dart';
import '../../storages/share_local.dart';
import '../../widgets/widget/widget_account_type.dart';
import '../../widgets/widget_dialog.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

enum SingingCharacter { nam, nu }

class _EditProfileScreenState extends State<EditProfileScreen> {




  DataProfile data = Get.arguments;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nbPhoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addController = TextEditingController();

  String? sex;
  @override
  void initState() {
    _nameController.text = (data.profile![0].name ?? "").toString();
    _emailController.text = (data.profile![0].email??"").toString();
    _nbPhoneController.text = (data.profile![0].phoneNumber??"").toString();
    _dobController.text = (data.profile![0].dob??"").toString();
    _addController.text =( data.profile![0].address??"").toString();

    if(data.profile![0].sex == "1"){
      sex = "1";
    }else{
      sex = "2";
    };
    super.initState();
  }

  bool readOnly = true;

  File? image;

  Future getImage() async {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: const Text('Ảnh đại diện'),
            cancelButton: CupertinoActionSheetAction(
              child: const Text('Huỷ'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () async {
                  try {
                    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

                    if(image == null) return;

                    final imageTemp = File(image.path);
                    //
                    // final croppedImage = await ImageCropper().cropImage(
                    //   sourcePath: image.path,
                    //   aspectRatioPresets: Platform.isAndroid ? crossAspectRatioAndroid : crossAspectRatioIos,
                    //   androidUiSettings: androidUiSettings,
                    //   iosUiSettings: iosUiSettings,
                    // );

                    setState(() => this.image = imageTemp);

                  } on PlatformException catch(e){
                    print('Error: $e');
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Chọn ảnh có sẵn'),
              ),
              CupertinoActionSheetAction(
                onPressed: () async {
                  try {
                    final image = await ImagePicker().pickImage(source: ImageSource.camera);

                    if(image == null) return;

                    final imageTemp = File(image.path);

                    setState(() => this.image = imageTemp);
                  } on PlatformException catch(e){
                    print('Error: $e');
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Chụp ảnh mới'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MainLayout(
      bgrColor: AppColors.greyE5,
      appbarColor: AppColors.white,
      appbarTitle: 'Đổi mật khẩu',
      body: SingleChildScrollView(
        child: SizedBox(
                height: AppValue.heights*0.9 - Spacing.viewPadding.bottom,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: AppColors.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 220,
                            width: size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: getImage,
                                      child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(80),
                                            child: (image != null) ? Image.file(
                                              image!,
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ) : Image.network(
                                              data.profile![0].avatar.toString(),
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SvgPicture.asset('assets/icons/camera.svg'),
                                        ],
                                      ),
                                    ),
                                    AppValue.hSpaceSmall,
                                    WidgetText(
                                      title: 'Đổi ảnh đại diện',
                                      style: AppStyle.DEFAULT_16,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  child: TextField(
                                    readOnly: readOnly,
                                    autofocus: true,
                                    textAlign: TextAlign.center,
                                    controller: _nameController,
                                    style: AppStyle.DEFAULT_18,
                                    scrollPadding: EdgeInsets.zero,
                                    textDirection: TextDirection.rtl,
                                    decoration: const InputDecoration(
                                        isDense: true,
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  height: 10,
                                ),
                                (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner") ? const WidgetAccountType(
                                  padding:  EdgeInsets.symmetric(
                                    vertical: 3,
                                    horizontal: 5,
                                  ),
                                  accountStyles: AccountStyles.accountOwner,
                                ) : (shareLocal.getString(PreferencesKey.USER_TYPE) == "customer") ?  const WidgetAccountType(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 3,
                                    horizontal: 5,
                                  ),
                                  accountStyles: AccountStyles.customer,) : const WidgetAccountType(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 3,
                                    horizontal: 5,
                                  ),
                                  accountStyles: AccountStyles.investors,)
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 10,
                            color: AppColors.greyE5,
                          ),
                          // rowInforUser(label: "Email", value: "",  controller: _emailController),
                          // rowInforUser(label: "Số điện thoại",  value: "",controller: _nbPhoneController),
                          // rowInforUser(label: "Ngày sinh", value: "", controller: _dobController),
                          // rowInforUser2(label: "Giới tính", value: "",),
                          // Column(
                          //   children: [
                          //     Padding(
                          //       padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          //       child: Row(
                          //         children: [
                          //           Text(
                          //             'Giới tính',
                          //             style: AppStyle.DEFAULT_14
                          //                 .copyWith(fontWeight: FontWeight.w500),
                          //           ),
                          //           const SizedBox(
                          //             width: 24,
                          //             height: 45,
                          //           ),
                          //           const Spacer(),
                          //           Row(
                          //             children: [
                          //               GestureDetector(
                          //                 onTap: (){
                          //                   setState(() {
                          //                     sex = "1";
                          //                   });
                          //                 },
                          //                 child: Row(
                          //                   children: [
                          //                    (sex == "1") ? Image.asset('assets/icons/eva_radio-button-on-fill.png',height: 20,width: 20,)
                          //                        : Image.asset('assets/icons/eva_radio-button-off-fill.png',height: 20,width: 20,),
                          //                     AppValue.hSpace(3),
                          //                     WidgetText(title: "Nam",style: AppStyle.DEFAULT_14,)
                          //                   ],
                          //                 ),
                          //               ),
                          //               AppValue.hSpace(24),
                          //               GestureDetector(
                          //                 onTap: (){
                          //                   setState(() {
                          //                     sex = "2";
                          //                   });
                          //                 },
                          //                 child: Row(
                          //                   children: [
                          //                     (sex == "2") ? Image.asset('assets/icons/eva_radio-button-on-fill.png',height: 20,width: 20,)
                          //                         : Image.asset('assets/icons/eva_radio-button-off-fill.png',height: 20,width: 20,),
                          //                     AppValue.hSpace(3),
                          //                     WidgetText(title: "Nữ",style: AppStyle.DEFAULT_14,)
                          //                   ],
                          //                 ),
                          //               ),
                          //             ],
                          //           )
                          //         ],
                          //       ),
                          //     ),
                          //     const Divider(
                          //           height: 0,
                          //           thickness: 2,
                          //           color: AppColors.greyE5,
                          //         )
                          //   ],
                          // ),
                          // rowInforUser(label: "Địa chỉ", value: "", controller: _addController),
                          // Container(height: 8,color: AppColors.greyE5),

                          GestureDetector(
                            onTap: (){
                              AppNavigator.navigateChangePassword();
                            },
                            child: Container(
                              color: AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Đổi mật khẩu',style: AppStyle.DEFAULT_14.copyWith(
                                        fontWeight: FontWeight.w500
                                    ),),
                                    const Icon(Icons.chevron_right_rounded)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    (image != null) ? BlocListener<ChangeProfileBloc, ChangeProfileState>(
                      listener: (context, state) {
                        if (state is SuccessChangeProfileState) {
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
                                    shareLocal.putString(PreferencesKey.Avatar, state.avatar);
                                    (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner")
                                        ? ProfileOwnBloc.of(context).add(InitGetProfileOwnEvent()) : (shareLocal.getString(PreferencesKey.USER_TYPE) == "customer")
                                        ?  ProfileCumBloc.of(context).add(InitGetProfileCumEvent())
                                        : ProfileInvBloc.of(context).add(InitGetProfileInvEvent());
                                  }
                              );
                            },
                          );
                        }
                        if (state is InProgressChangeProfileState) {
                          GetSnackBarUtils.createProgress();
                        }
                        if (state is FailureChangeProfileState) {
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
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                        child: Center(
                          child: WidgetButton(
                            isPrimaryButton: true,
                            ontap: () {
                              ChangeProfileBloc.of(context).add(ChangeFileSubmitted(
                                  sendimage: image!,
                                  email: _emailController.text,
                                  phoneNumber: _nbPhoneController.text,
                                  dateOfBirth: _dobController.text,
                                  gender: sex!,
                                  address: _addController.text
                              )
                              );
                            },
                            text: 'Cập nhật thông tin',
                          ),
                        ),
                      ),
                    ) : BlocListener<ChangeProfileNoAvtBloc, ChangeProfileNoAvtState>(
                      listener: (context, state) {
                        if (state is SuccessChangeProfileNoAvtState) {
                          GetSnackBarUtils.removeSnackBar();
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return WidgetDialog(
                                  title: MESSAGES.NOTIFICATION,
                                  content: state.message,
                                  onTap1: (){
                                    Get.back();
                                    Get.back();
                                    (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner")
                                        ? ProfileOwnBloc.of(context).add(InitGetProfileOwnEvent()) : (shareLocal.getString(PreferencesKey.USER_TYPE) == "customer")
                                        ?  ProfileCumBloc.of(context).add(InitGetProfileCumEvent())
                                        : ProfileInvBloc.of(context).add(InitGetProfileInvEvent());
                                  }
                              );
                            },
                          );
                        }
                        if (state is InProgressChangeProfileNoAvtState) {
                          GetSnackBarUtils.createProgress();
                        }
                        if (state is FailureChangeProfileNoAvtState) {
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
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                        child: Center(
                          child: WidgetButton(
                            isPrimaryButton: true,
                            ontap: () {
                              ChangeProfileNoAvtBloc.of(context).add(ChangeFileNoAvtSubmitted(
                                  email: _emailController.text,
                                  phoneNumber: _nbPhoneController.text,
                                  dateOfBirth: _dobController.text,
                                  gender: sex!,
                                  address: _addController.text
                              )
                              );
                            },
                            text: 'Cập nhật thông tin',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  InkWell rowInforUser({
    String? label,
    String? value,
    Widget? divider,
    VoidCallback? ontap,
    Widget? right,
    double? paddingVetical = 0,
    required TextEditingController controller,
  }) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                16, paddingVetical ?? 0, 16, paddingVetical ?? 0),
            child: Row(
              children: [
                Text(
                  label ?? '',
                  style: AppStyle.DEFAULT_14
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 24,
                ),
                right ??
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.right,
                        controller: controller,
                        scrollPadding: EdgeInsets.zero,
                        // textDirection: TextDirection.rtl,
                        decoration:  const InputDecoration(
                          // hintText: value!,
                          // hintTextDirection: TextDirection.rtl,
                            border: InputBorder.none
                        ),
                      ),
                    )
              ],
            ),
          ),
          divider ??
              const Divider(
                height: 0,
                thickness: 2,
                color: AppColors.greyE5,
              )
        ],
      ),
    );
  }

}
