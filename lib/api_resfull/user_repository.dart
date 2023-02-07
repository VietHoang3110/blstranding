import 'dart:io';
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart' show Dio; // ignore: import_of_legacy_library_into_null_safe
import 'package:quan_ly/api_resfull/dio_provider.dart';
import 'package:quan_ly/src/models/model_generator/profile.dart';
import 'package:quan_ly/src/models/model_generator/proviso.dart';

import 'package:quan_ly/src/src_index.dart';
import 'package:quan_ly/storages/share_local.dart';

import '../src/models/model_generator/change_pass_request.dart';
import '../src/models/model_generator/change_profile_request.dart';
import '../src/models/model_generator/contact.dart';
import '../src/models/model_generator/contract_inv.dart';
import '../src/models/model_generator/home.dart';
import '../src/models/model_generator/home_inv.dart';
import '../src/models/model_generator/home_own.dart';
import '../src/models/model_generator/info.dart';
import '../src/models/model_generator/login.dart';
import '../src/models/model_generator/money.dart';
import '../src/models/model_generator/money_own.dart';
import '../src/models/model_generator/noti.dart';
import '../src/models/model_generator/read_noti.dart';
import '../src/models/model_generator/realized.dart';
import '../src/models/model_generator/realized_own.dart';
import '../src/models/model_generator/sumrealized.dart';
import '../src/models/model_generator/sumrealized_own.dart';
import '../src/models/model_generator/sumunrealized.dart';
import '../src/models/model_generator/sumunrealized_own.dart';
import '../src/models/model_generator/trans.dart';
import '../src/models/model_generator/trans_own.dart';
import '../src/models/model_generator/unrealized.dart';
import '../src/models/model_generator/unrealized_own.dart';
import '../src/models/model_generator/update_profile.dart';
enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class UserRepository {
  Dio dio = Dio();
  final _controller = StreamController<AuthenticationStatus>();
  final _controllerUser = StreamController<InfoUser>();
  UserRepository() {
    statusUser.listen((event) {
      if(event.token == dotenv.env[PreferencesKey.TOKEN]!){
        dio = DioProvider.instance();
      }else{
        dio = DioProvider.instance(token: shareLocal.getString(PreferencesKey.TOKEN));
      }
    });
    // if (shareLocal.getString(PreferencesKey.TOKEN) != '' ||
    //     shareLocal.getString(PreferencesKey.TOKEN) != null)
    //   DioProvider.instance(token: shareLocal.getString(PreferencesKey.TOKEN));
    // else
    //   DioProvider.instance();
  }

  //==========================================> GET <=========================================

  Future<ResponseDataStatus> getInfoUser() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getInfoUser();

  Future<IntroduceResponse> getFirstIntro() async => await RestClient(dio, baseUrl: dio.options.baseUrl).firstIntroduce();

  Future<LogoResponse> getLogo() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getLogo();

  Future<ListNewsResponse> getListNews({required int pageSize, required int currentPage}) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getListNews(pageSize, currentPage);

  Future<ListDocumentsResponse> getListDocuments() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getListDocuments();

  Future<IntroduceResponse> getIntroduce() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getIntroduce();

  Future<CoursesResponse> getCourse() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getCourse();

  Future<LoginResponse> getLoginApp(String username, String password, String type) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getLoginApp(username, password, type);

  Future<HomeResponse> getHome() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getHome();

  Future<HomeInvResponse> getHomeInv(int page, int numOfRecords) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getHomeInv(page, numOfRecords);

  Future<HomeOwnResponse> getHomeOwn() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getHomeOwn();

  Future<ContractInvResponse> getContractInv(int page, int numOfRecords) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getContractInv(page, numOfRecords);

  Future<TransResponse> getTrans(int page, int numOfRecords) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getTrans( page,  numOfRecords);

  Future<TransOwnResponse> getTransOwn(int page, int numOfRecords) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getTransOwn( page,  numOfRecords);

  Future<MoneyResponse> getMoney(int page, int numOfRecords) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getMoney( page,  numOfRecords);

  Future<MoneyOwnResponse> getMoneyOwn(int page, int numOfRecords) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getMoneyOwn(page, numOfRecords);

  Future<UnrealizedResponse> getUnrealized() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getUnrealized();

  Future<UnrealizedOwnResponse> getUnrealizedOwn() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getUnrealizedOwn();

  Future<SumunrealizedResponse> getSumunrealized() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getSumunrealized();

  Future<SumunrealizedOwnResponse> getSumunrealizedOwn() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getSumunrealizedOwn();

  Future<RealizedResponse> getRealized(int page, int numOfRecords) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getRealized(page, numOfRecords);

  Future<RealizedOwnResponse> getRealizedOwn() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getRealizedOwn();

  Future<SumrealizedResponse> getSumrealized() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getSumrealized();

  Future<SumrealizedOwnResponse> getSumrealizedOwn() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getSumrealizedOwn();

  Future<ProfileResponse> getProfile() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getProfile();

  Future<ProfileResponse> getProfileOwn() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getProfileOwn();

  Future<ProfileResponse> getProfileInv() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getProfileInv();

  Future<Info> getInfo() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getInfo();

  Future<Contact> getContact() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getContact();

  Future<proviso> getProviso() async => await RestClient(dio, baseUrl: dio.options.baseUrl).getProviso();

  Future<NotiResponse> getNoti(int page, int numOfRecords) async => await RestClient(dio, baseUrl: dio.options.baseUrl).getNoti(page, numOfRecords);


  Future<BaseResponse> changePass({required String oldPassword, required String newPassword, required String confirmPassword}) async =>
      await RestClient(dio, baseUrl: dio.options.baseUrl).changePassword(ChangePassRequest(oldPassword,newPassword,confirmPassword));

  Future<UpdateProfile> changeProfile({
      required File sendimage,
      required String email,
      required String phoneNumber,
      required String dateOfBirth,
      required String gender,
      required String address,
  }) async => await RestClient(dio, baseUrl: dio.options.baseUrl).changeProfile(sendimage, email, phoneNumber, dateOfBirth, gender, address);

  Future<BaseResponse> changeProfileNoAvt({
    required String email,
    required String phoneNumber,
    required String dateOfBirth,
    required String gender,
    required String address,
  }) async => await RestClient(dio, baseUrl: dio.options.baseUrl).changeProfileNoAvt(email, phoneNumber, dateOfBirth, gender, address);


  Future<ReadNoti> readNoti({
    required String id,
  }) async => await RestClient(dio, baseUrl: dio.options.baseUrl).readNoti(id);


  //=========================================> POST <=========================================

  // Future<LoginResponse> loginApp({required String email, required String password, required String token_firebase}) async =>
  //     await RestClient(dio, baseUrl: dio.options.baseUrl).loginApp(LoginAppRequest(email: email, password: password, token_firebase: token_firebase));


  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Stream<InfoUser> get statusUser async* {
    yield* _controllerUser.stream;
  }

  void logOut() => _controller.add(AuthenticationStatus.unauthenticated);

  void addUser(InfoUser user) => _controllerUser.add(user);

  void dispose(){
    _controllerUser.close();
    _controller.close();
  }
}