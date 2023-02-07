
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quan_ly/storages/share_local.dart';
import 'package:quan_ly/widgets/widget_text.dart';
import '../../bloc/get_profile/get_profile_bloc.dart';
import '../../bloc/get_profile_inv/get_profile_inv_bloc.dart';
import '../../bloc/get_profile_own/get_profile_own_bloc.dart';
import '../../src/models/model_generator/profile.dart';
import '../../src/src_index.dart';
import '../../widgets/widget/widget_account_type.dart';

class WidgetDrawer extends StatefulWidget {
  const WidgetDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<WidgetDrawer> createState() => _WidgetDrawerState();
}

class _WidgetDrawerState extends State<WidgetDrawer> {
  @override
  void initState() {
    (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner")
        ? ProfileOwnBloc.of(context).add(InitGetProfileOwnEvent()) : (shareLocal.getString(PreferencesKey.USER_TYPE) == "customer")
        ?  ProfileCumBloc.of(context).add(InitGetProfileCumEvent())
        : ProfileInvBloc.of(context).add(InitGetProfileInvEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // AppUser appUser = context.read<UserRepository>().user ?? AppUser.empty;
    return Drawer(
      child: Container(
        color: AppColors.greyE6,
        child: Column(
          children: [
            Container(
              width: AppValue.widths,
              color: Color(0xff115456),
              height: AppValue.heights * .25,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: buildInfoNew(),
                  // (shareLocal.getString(PreferencesKey.USER_TYPE) == "customer") ? BlocBuilder<ProfileCumBloc, ProfileCumState>(
                  //   builder: (context, state) {
                  //     if(state is UpdateGetProfileCumState){
                  //       DataProfile data = state.data;
                  //       return buildInfo(data);
                  //     }else{
                  //       return Container();
                  //     }
                  //   },
                  // ) : (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner") ? BlocBuilder<ProfileOwnBloc, ProfileOwnState>(
                  //   builder: (context, state) {
                  //     if(state is UpdateGetProfileOwnState){
                  //       DataProfile data = state.data;
                  //       return buildInfo(data);
                  //     }else{
                  //       return Container();
                  //     }
                  //   },
                  // ) :  BlocBuilder<ProfileInvBloc, ProfileInvState>(
                  //   builder: (context, state) {
                  //     if(state is UpdateGetProfileInvState){
                  //       DataProfile data = state.data;
                  //       return buildInfo(data);
                  //     }else{
                  //       return Container();
                  //     }
                  //   },
                  // ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner") ? RowDrawerItem(
                      marginBottom: 9,
                      text: 'Trang chủ',
                      ontap: () {
                        AppNavigator.navigateMainOwn();
                      },
                      svgIconPath: "assets/icons/bank 1.svg",
                      colorSvg: Colors.deepOrange,
                    )
                  : (shareLocal.getString(PreferencesKey.USER_TYPE) == "customer") ?  RowDrawerItem(
                      marginBottom: 9,
                      text: 'Trang chủ',
                      ontap: () {
                        AppNavigator.navigateMain();
                      },
                      svgIconPath: "assets/icons/bank 1.svg",
                      colorSvg: Colors.deepOrange,
                    )
                  : RowDrawerItem(
                      marginBottom: 9,
                      text: 'Hợp đồng đầu tư',
                      ontap: () {
                        AppNavigator.navigateMainInv();
                      },
                      svgIconPath: "assets/icons/bank 1.svg",
                      colorSvg: Colors.deepOrange,
                    ),

                    (shareLocal.getString(PreferencesKey.USER_TYPE) == "investors")
                        ? RowDrawerItem(
                      marginBottom: 9,
                      text: 'Hợp đồng đã tất toán',
                      ontap: () {
                        AppNavigator.navigateFinalizationContract();
                      },
                      svgIconPath: "assets/icons/chart-histogram.svg",
                    ) : Column(
                      children: [
                        RowDrawerItem(
                          text: 'Lịch sử giao dịch',
                          ontap: () {
                            (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner")
                                ? AppNavigator.navigateHistoryTransactionOwn() : AppNavigator.navigateHistoryTransaction();
                          },
                          svgIconPath: "assets/icons/chart-histogram.svg",
                        ),
                        (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner") ? RowDrawerItem(
                          text: 'Giao dịch tiền',
                          ontap: () {
                            AppNavigator.navigateHistoryDepositOwn();
                          },
                          svgIconPath: "assets/icons/money-check-edit1.svg",
                        ) :RowDrawerItem(
                          text: 'Giao dịch tiền',
                          ontap: () {
                            AppNavigator.navigateHistoryDeposit();
                          },
                          svgIconPath: "assets/icons/money-check-edit1.svg",
                        ),
                        (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner") ?
                            Container()
                        // RowDrawerItem(
                        //   text: 'Danh mục tạm tính',
                        //   ontap: () {
                        //     (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner")
                        //         ? AppNavigator.navigateProvisionalListOwn() : AppNavigator.navigateProvisionalList();
                        //   },
                        //   svgIconPath: "assets/icons/list-check1.svg",
                        // )
                            : RowDrawerItem(
                          text: 'Danh mục tạm tính',
                          ontap: () {
                            AppNavigator.navigateProvisionalList();
                          },
                          svgIconPath: "assets/icons/list-check1.svg",
                        ),
                        (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner") ?
                            Container()
                        // RowDrawerItem(
                        //   text: 'Tổng hợp tạm tính',
                        //   ontap: () {
                        //     (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner")
                        //         ? AppNavigator.navigateProvisionalSummaryOwn() : AppNavigator.navigateProvisionalSummary();
                        //   },
                        //   svgIconPath: "assets/icons/search-alt.svg",
                        // )
                            : RowDrawerItem(
                          text: 'Tổng hợp tạm tính',
                          ontap: () {
                             AppNavigator.navigateProvisionalSummary();
                          },
                          svgIconPath: "assets/icons/search-alt.svg",
                        ),
                        (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner") ?
                            Container()
                        // RowDrawerItem(
                        //   text: 'Danh mục tất toán',
                        //   ontap: () {
                        //     (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner")
                        //         ? AppNavigator.navigateListofSettlementsOwn() : AppNavigator.navigateListofSettlements();
                        //   },
                        //   svgIconPath: "assets/icons/calendar-lines1.svg",
                        // )
                            : RowDrawerItem(
                          text: 'Danh mục tất toán',
                          ontap: () {
                            AppNavigator.navigateListofSettlements();
                          },
                          svgIconPath: "assets/icons/calendar-lines1.svg",
                        ),
                        (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner") ?
                            Container(
                              margin: EdgeInsets.only(bottom: 9),
                            )
                        // RowDrawerItem(
                        //   marginBottom: 9,
                        //   text: 'Tổng hợp tất toán',
                        //   ontap: () {
                        //     (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner")
                        //         ? AppNavigator.navigateSummaryOfSettlementsOwn() : AppNavigator.navigateSummaryOfSettlements();
                        //   },
                        //   svgIconPath: "assets/icons/edit.svg",
                        // )
                            : RowDrawerItem(
                          marginBottom: 9,
                          text: 'Tổng hợp tất toán',
                          ontap: () {
                            AppNavigator.navigateSummaryOfSettlements();
                          },
                          svgIconPath: "assets/icons/edit.svg",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        (shareLocal.getString(PreferencesKey.USER_TYPE) == "customer") ? BlocBuilder<ProfileCumBloc, ProfileCumState>(
                          builder: (context, state) {
                            if(state is UpdateGetProfileCumState){
                              DataProfile data = state.data;
                              return buildProfile(data);
                            }else{
                              return Container();
                            }
                          },
                        ) : (shareLocal.getString(PreferencesKey.USER_TYPE) == "owner") ? BlocBuilder<ProfileOwnBloc, ProfileOwnState>(
                          builder: (context, state) {
                            if(state is UpdateGetProfileOwnState){
                              DataProfile data = state.data;
                              return buildProfile(data);
                            }else{
                              return Container();
                            }
                          },
                        ) :  BlocBuilder<ProfileInvBloc, ProfileInvState>(
                          builder: (context, state) {
                            if(state is UpdateGetProfileInvState){
                              DataProfile data = state.data;
                              return buildProfile(data);
                            }else{
                              return Container();
                            }
                          },
                        ),
                        // RowDrawerItem(
                        //   text: 'Ngôn ngữ',
                        //   ontap: () {
                        //     AppNavigator.navigateLanguage();
                        //   },
                        //   svgIconPath: "assets/icons/globe.svg",
                        // ),
                        // RowDrawerItem(
                        //   text: 'Về chúng tôi',
                        //   ontap: () {
                        //     AppNavigator.navigateAboutUs();
                        //   },
                        //   svgIconPath: "assets/icons/info1.svg",
                        // ),
                        // RowDrawerItem(
                        //   text: 'Điều khoản và chính sách',
                        //   ontap: () {
                        //     AppNavigator.navigateRules();
                        //   },
                        //   svgIconPath: "assets/icons/diploma.svg",
                        // ),
                        // RowDrawerItem(
                        //   marginBottom: 8,
                        //   text: 'Liên hệ',
                        //   ontap: () {
                        //     AppNavigator.navigateContact();
                        //   },
                        //   svgIconPath: "assets/icons/comment-alt1.svg",
                        // ),
                        RowDrawerItem(
                          marginBottom: 100,
                          text: 'Đăng xuất',
                          ontap: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                content: SizedBox(
                                  width: AppValue.widths*0.9,
                                  height: 50,
                                  child: Column(
                                    children: [
                                      WidgetText(
                                        title: 'Đăng xuất',
                                        style: AppStyle.DEFAULT_16.copyWith(
                                            fontWeight: FontWeight.w500,
                                          color: AppColors.primaryColor
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      WidgetText(
                                        title: 'Bạn muốn đăng xuất ra khỏi ứng dụng?',
                                        style: AppStyle.DEFAULT_14.copyWith(
                                            fontWeight: FontWeight.w400
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          await shareLocal.putString(PreferencesKey.TOKEN, '');
                                          await shareLocal.putBools(PreferencesKey.FIRST_TIME, false);
                                          AppNavigator.navigateLogin();
                                        },
                                        child: Container(
                                          width: Get.width*0.35,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Center(
                                            child: WidgetText(
                                              title: 'Xác nhận',
                                              style: AppStyle.DEFAULT_16.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.white
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      AppValue.hSpaceSmall,
                                      GestureDetector(
                                        onTap: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: Get.width*0.35,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: AppColors.white,
                                              border: Border.all(width: 1,color: AppColors.grey)
                                          ),
                                          child: Center(
                                            child: WidgetText(
                                              title: 'Hủy',
                                              style: AppStyle.DEFAULT_16.copyWith(
                                                  fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          svgIconPath: "assets/icons/sign-out.svg",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  RowDrawerItem buildProfile(DataProfile data) {
    return RowDrawerItem(text: 'Đổi mật khẩu',
      ontap: () {
        Get.back();
        AppNavigator.navigateChangeInformationAccount(data);
      },
      svgIconPath: "assets/icons/user.svg",
    );

  }

  buildInfo(DataProfile data) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.network(
                data.profile![0].avatar ?? "https://www.w3schools.com/howto/img_avatar.png",
                width: 75,
                height: 75,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( data.profile![0].name ?? "Khách hàng",
                  style: AppStyle.DEFAULT_16.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.white),
                ),
                AppValue.vSpace(7),
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
          ],
        ),
        GestureDetector(
          onTap: (){
            print('aaa ${shareLocal.getString(PreferencesKey.USER_TYPE)}');
          },
            child: SvgPicture.asset("assets/icons/ic_edit.svg"))
      ],
    );
  }

  buildInfoNew() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.network(
                shareLocal.getString(PreferencesKey.Avatar) ?? "https://www.w3schools.com/howto/img_avatar.png",
                width: 75,
                height: 75,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( shareLocal.getString(PreferencesKey.Name) ?? "Khách hàng",
                  style: AppStyle.DEFAULT_16.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.white),
                ),
                AppValue.vSpace(7),
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
          ],
        ),
        // GestureDetector(
        //     onTap: (){
        //       print('aaa ${shareLocal.getString(PreferencesKey.USER_TYPE)}');
        //     },
        //     child: SvgPicture.asset("assets/icons/ic_edit.svg"))
      ],
    );
  }
}

class RowDrawerItem extends StatelessWidget {
  const RowDrawerItem({
    Key? key,
    this.icon,
    this.text,
    this.svgIconPath,
    this.marginBottom,
    this.ontap,
    this.colorSvg
  }) : super(key: key);
  final Widget? icon;
  final String? svgIconPath, text;
  final Color? colorSvg;
  final VoidCallback? ontap;
  final double? marginBottom;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        color: AppColors.white,
        margin: EdgeInsets.only(bottom: marginBottom ?? 2),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SvgPicture.asset(
                svgIconPath ?? "assets/icons/chart-histogram.svg",
                color: colorSvg,
                height: 21,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text??""),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.grey,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
