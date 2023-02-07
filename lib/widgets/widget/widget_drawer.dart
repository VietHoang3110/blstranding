//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../bloc/repositories/user_repository.dart';
// import '../styles/app_styles/values.dart';
//
// class WidgetDrawer extends StatelessWidget {
//   const WidgetDrawer({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     AppUser appUser = context.read<UserRepository>().user ?? AppUser.empty;
//     Size size = MediaQuery.of(context).size;
//     return Drawer(
//       child: Container(
//         height: AppValue.heights,
//         color: AppColors.greyE6,
//         child: Column(
//           children: [
//             Container(
//               width: size.width,
//               constraints:
//                   const BoxConstraints(maxHeight: 190, minHeight: 170),
//               color: AppColors.primaryColor,
//               height: size.height * .25,
//               child: Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Wrap(
//                         crossAxisAlignment: WrapCrossAlignment.center,
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(80),
//                             child: Image.network(
//                               appUser.avatar ??
//                                   "https://www.w3schools.com/howto/img_avatar.png",
//                               width: 75,
//                               height: 75,
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 8,
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text( appUser.fullname ?? "Khách hàng",
//                                 style: AppTextStyle.textStyle16.copyWith(
//                                     fontWeight: FontWeight.w500,
//                                     color: AppColors.white),
//                               ),
//                               const WidgetAccountType(
//                                 padding: EdgeInsets.symmetric(
//                                   vertical: 3,
//                                   horizontal: 5,
//                                 ),
//                                 accountStyles: AccountStyles.customer,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SvgPicture.asset("assets/icons/ic_edit.svg")
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     RowDrawerItem(
//                       text: appLanguage["historyTransaction"]!,
//                       ontap: () {
//                         navigatorKey.currentState!.pushNamed("HistoryTransaction");
//                       },
//                       svgIconPath: "assets/icons/chart-histogram.svg",
//                     ),
//                     RowDrawerItem(
//                       text: appLanguage["historyDeposit"]!,
//                       ontap: () {
//                         navigatorKey.currentState!.pushNamed("HistoryDeposit");
//                       },
//                       svgIconPath: "assets/icons/money-check-edit1.svg",
//                     ),
//                     RowDrawerItem(
//                       text: appLanguage["provisionallist"]!,
//                       ontap: () {
//                         navigatorKey.currentState!.pushNamed("ProvisionalList");
//                       },
//                       svgIconPath: "assets/icons/list-check1.svg",
//                     ),
//                     RowDrawerItem(
//                       text: appLanguage["synthetic"]!,
//                       ontap: () {
//                         print("object");
//                       },
//                       svgIconPath: "assets/icons/search-alt.svg",
//                     ),
//                     RowDrawerItem(
//                       text: appLanguage["listofsettlements"]!,
//                       ontap: () {
//                         print("object");
//                       },
//                       svgIconPath: "assets/icons/calendar-lines1.svg",
//                     ),
//                     RowDrawerItem(
//                       marginBottom: 9,
//                       text: appLanguage["settlements"]!,
//                       ontap: () {
//                         print("object");
//                       },
//                       svgIconPath: "assets/icons/edit.svg",
//                     ),
//                     RowDrawerItem(
//                       text: appLanguage["account"]!,
//                       ontap: () {
//                         navigatorKey.currentState!.pushNamed("UserProfileScreen");
//                       },
//                       svgIconPath: "assets/icons/user.svg",
//                     ),
//                     RowDrawerItem(
//                       text: appLanguage["language"]!,
//                       ontap: () {
//                         print("object");
//                       },
//                       svgIconPath: "assets/icons/globe.svg",
//                     ),
//                     RowDrawerItem(
//                       text: appLanguage["aboutme"]!,
//                       ontap: () {
//                         print("object");
//                       },
//                       svgIconPath: "assets/icons/info1.svg",
//                     ),
//                     RowDrawerItem(
//                       text: appLanguage["terms"]!,
//                       ontap: () {
//                         print("object");
//                       },
//                       svgIconPath: "assets/icons/diploma.svg",
//                     ),
//                     RowDrawerItem(
//                       marginBottom: 8,
//                       text: appLanguage["contact"]!,
//                       ontap: () {
//                         print("object");
//                       },
//                       svgIconPath: "assets/icons/comment-alt1.svg",
//                     ),
//                     RowDrawerItem(
//                       marginBottom: 100,
//                       text: appLanguage["logout"]!,
//                       ontap: () {
//                         showDialog(
//                           context: context,
//                           barrierDismissible: false,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               actionsAlignment: MainAxisAlignment.spaceAround,
//                               content: Text(appLanguage["areyoulogout"]!),
//                               actions: <Widget>[
//                                 TextButton(
//                                   child: const Text('Yes'),
//                                   onPressed: () {
//                                     context.read<UserRepository>().logOut();
//                                   },
//                                 ),
//                                 TextButton(
//                                   child: const Text(
//                                     'No',
//                                     style: TextStyle(color: AppColors.grey),
//                                   ),
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                       svgIconPath: "assets/icons/sign-out.svg",
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class RowDrawerItem extends StatelessWidget {
//   const RowDrawerItem({
//     Key? key,
//     this.icon,
//     this.text,
//     this.svgIconPath,
//     this.marginBottom,
//     this.ontap,
//   }) : super(key: key);
//   final Widget? icon;
//   final String? svgIconPath, text;
//   final VoidCallback? ontap;
//   final double? marginBottom;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: ontap,
//       child: Container(
//         color: AppColors.white,
//         margin: EdgeInsets.only(bottom: marginBottom ?? 2),
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 15),
//               child: SvgPicture.asset(
//                 svgIconPath ?? "assets/icons/chart-histogram.svg",
//                 height: 21,
//               ),
//             ),
//             const SizedBox(
//               width: 8,
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(text ?? appLanguage["historyTransaction"]!),
//                     const Icon(
//                       Icons.arrow_forward_ios_rounded,
//                       color: AppColors.grey,
//                       size: 24,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
