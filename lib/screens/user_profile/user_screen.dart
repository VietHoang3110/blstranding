
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quan_ly/bloc/get_profile/get_profile_bloc.dart';
import 'package:quan_ly/bloc/get_profile_inv/get_profile_inv_bloc.dart';
import 'package:quan_ly/bloc/get_profile_own/get_profile_own_bloc.dart';
import 'package:quan_ly/storages/share_local.dart';
import '../../src/models/model_generator/profile.dart';
import '../../src/src_index.dart';
import '../../widgets/widget/main_layout.dart';
import '../../widgets/widget/widget_account_type.dart';
import '../../widgets/widget/widget_button.dart';


class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

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
    return MainLayout(
      appbarColor: AppColors.white,
      bgrColor: AppColors.greyE5 ,
      appbarTitle: 'Thông tin tài khoản',
      body: (shareLocal.getString(PreferencesKey.USER_TYPE) == "customer") ? BlocBuilder<ProfileCumBloc, ProfileCumState>(
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
    );
  }

  buildProfile(DataProfile data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: AppColors.white,
          child: Column(
            children: [
              SizedBox(
                height: 220,
                width: AppValue.widths,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.network(
                        data.profile![0].avatar ?? "https://www.w3schools.com/howto/img_avatar.png",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      data.profile![0].name ?? "",
                      style: AppStyle.DEFAULT_18,
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
              rowInforUser(label: 'Email', value: data.profile![0].email),
              rowInforUser(label: 'Số điện thoại', value: data.profile![0].phoneNumber),
              rowInforUser(label: 'Ngày sinh', value: data.profile![0].dob),
              rowInforUser(label: 'Giới tính', value: (data.profile![0].sex=="1") ? "Nam" : "Nữ"),
              rowInforUser(label: 'Địa chỉ', value: data.profile![0].address,),
              Container(height: 8,color: AppColors.greyE5),
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
        Container(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
          color: AppColors.greyE5,
          child: Center(
            child: WidgetButton(
              isPrimaryButton: true,
              ontap: () {
                AppNavigator.navigateChangeInformationAccount(data);
              },
              text: 'Chỉnh sửa thông tin',
            ),
          ),
        ),
      ],
    );
  }

  Column rowInforUser({
    String? label,
    String? value,
    Widget? divider,
    Widget? right,
    double? paddingVetical = 0,
  }) {
    return Column(
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
                      readOnly: true,
                      scrollPadding: EdgeInsets.zero,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        hintText: value,
                        hintTextDirection: TextDirection.rtl,
                        border: InputBorder.none
                        // focusedBorder: InputBorder.none,
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
    );
  }
}
