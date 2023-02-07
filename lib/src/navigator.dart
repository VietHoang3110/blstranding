import 'package:get/get.dart';
import 'package:quan_ly/src/router.dart';

import 'models/model_generator/noti.dart';
import 'models/model_generator/profile.dart';

class AppNavigator {
  AppNavigator._();

  static navigateBack() async => Get.back();

  static navigateSplash() async => await Get.toNamed(ROUTE_NAMES.SPLASH);

  static navigateLogin() async => await Get.toNamed(ROUTE_NAMES.LOGIN);

  static navigateLoginFake() async => await Get.toNamed(ROUTE_NAMES.LOGIN_Fake);

  static navigateHistoryTransaction() async => await Get.toNamed(ROUTE_NAMES.History_Transaction);

  static navigateHistoryDeposit() async => await Get.toNamed(ROUTE_NAMES.History_Deposit);

  static navigateProvisionalList() async => await Get.toNamed(ROUTE_NAMES.Provisional_List);

  static navigateProvisionalSummary() async => await Get.toNamed(ROUTE_NAMES.Provisional_Summary);

  static navigateListofSettlements() async => await Get.toNamed(ROUTE_NAMES.List_of_Settlements);

  static navigateSummaryOfSettlements() async => await Get.toNamed(ROUTE_NAMES.Summary_Of_Settlements);

  static navigateHistoryTransactionOwn() async => await Get.toNamed(ROUTE_NAMES.History_Transaction_Own);

  static navigateHistoryDepositOwn() async => await Get.toNamed(ROUTE_NAMES.History_Deposit_Own);

  static navigateProvisionalListOwn() async => await Get.toNamed(ROUTE_NAMES.Provisional_List_Own);

  static navigateProvisionalSummaryOwn() async => await Get.toNamed(ROUTE_NAMES.Provisional_Summary_Own);

  static navigateListofSettlementsOwn() async => await Get.toNamed(ROUTE_NAMES.List_of_Settlements_Own);

  static navigateSummaryOfSettlementsOwn() async => await Get.toNamed(ROUTE_NAMES.Summary_Of_Settlements_Own);

  static navigateUserProfileScreen() async => await Get.toNamed(ROUTE_NAMES.UserProfileScreen);

  static navigateLanguage() async => await Get.toNamed(ROUTE_NAMES.Language);
  static navigateRules() async => await Get.toNamed(ROUTE_NAMES.Rules);
  static navigateContact() async => await Get.toNamed(ROUTE_NAMES.Contact);
  static navigateAboutUs() async => await Get.toNamed(ROUTE_NAMES.aboutUs);
  static navigateNotification() async => await Get.toNamed(ROUTE_NAMES.noti);
  static navigateDetailNoti(Noti data, int page) async => await Get.toNamed(ROUTE_NAMES.DetailNoti,arguments: [data,page]);

  static navigateFinalizationContract() async => await Get.toNamed(ROUTE_NAMES.Finalization_Contract_Inv);


  static navigateLogout() async => await Get.offAllNamed(ROUTE_NAMES.LOGIN);

  static navigateMain() async => await Get.offAllNamed(ROUTE_NAMES.MAIN);

  static navigateMainInv() async => await Get.offAllNamed(ROUTE_NAMES.MAIN_INV);

  static navigateMainOwn() async => await Get.offAllNamed(ROUTE_NAMES.MAIN_OWN);

  static navigateIntro() async => await Get.offAllNamed(ROUTE_NAMES.INTRO);

  static navigateForgotPassword() async => await Get.toNamed(ROUTE_NAMES.FORGOT_PASSWORD);

  static navigateForgotPasswordOTP(email) async => await Get.toNamed(ROUTE_NAMES.FORGOT_PASSWORD_OTP, arguments: email);

  static navigateForgotPasswordReset(data) async => await Get.toNamed(ROUTE_NAMES.FORGOT_PASSWORD_RESET, arguments: data);

  static navigateChangePassword() async => await Get.toNamed(ROUTE_NAMES.CHANGE_PASSWORD);

  static navigateInformationAccount() async => await Get.toNamed(ROUTE_NAMES.INFORMATION_ACCOUNT);

  static navigateInfo() async => await Get.toNamed(ROUTE_NAMES.INFO);

  static navigateTerm() async => await Get.toNamed(ROUTE_NAMES.TERM);

  static navigateChangeInformationAccount(DataProfile? data) async => await Get.toNamed(ROUTE_NAMES.CHANGE_INFORMATION_ACCOUNT,arguments: data);

  static navigateDetailNew(arguments) async => await Get.toNamed(ROUTE_NAMES.DETAIL_NEW, arguments: arguments);

  static navigateDetailDocument(arguments) async => await Get.toNamed(ROUTE_NAMES.DETAIL_DOCUMENT, arguments: arguments);

  static navigateEditInfo(arguments) async => await Get.toNamed(ROUTE_NAMES.EDIT_INFO, arguments: arguments);

  static navigateSearch() async => await Get.toNamed(ROUTE_NAMES.SEARCH_SCREEN);

  static navigateCourseDetailScreen(arguments) async => await Get.toNamed(ROUTE_NAMES.COURSE_DETAIL_SCREEN, arguments: arguments);

  static navigateBuyCourseScreen(arguments) async => await Get.toNamed(ROUTE_NAMES.BUY_COURSE, arguments: arguments);

}
