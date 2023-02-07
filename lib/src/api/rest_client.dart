import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:quan_ly/src/models/model_generator/home.dart';
import 'package:quan_ly/src/models/model_generator/login.dart';
import 'package:quan_ly/src/models/model_generator/unrealized.dart';
import 'package:retrofit/retrofit.dart';
import 'package:quan_ly/src/base.dart';
import 'package:quan_ly/src/models/index.dart';

import '../models/model_generator/change_pass_request.dart';
import '../models/model_generator/contact.dart';
import '../models/model_generator/contract_inv.dart';
import '../models/model_generator/home_inv.dart';
import '../models/model_generator/home_own.dart';
import '../models/model_generator/info.dart';
import '../models/model_generator/money.dart';
import '../models/model_generator/money_own.dart';
import '../models/model_generator/noti.dart';
import '../models/model_generator/profile.dart';
import '../models/model_generator/proviso.dart';
import '../models/model_generator/read_noti.dart';
import '../models/model_generator/realized.dart';
import '../models/model_generator/realized_own.dart';
import '../models/model_generator/sumrealized.dart';
import '../models/model_generator/sumrealized_own.dart';
import '../models/model_generator/sumunrealized.dart';
import '../models/model_generator/sumunrealized_own.dart';
import '../models/model_generator/trans.dart';
import '../models/model_generator/trans_own.dart';
import '../models/model_generator/unrealized_own.dart';
import '../models/model_generator/update_profile.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: "https://onthicongchuc.net/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  // =================================> GET <===================================

  @GET(BASE_URL.GET_INFO_USER)
  Future<ResponseDataStatus> getInfoUser();


  // @GET(BASE_URL.OTP_RESET_PASSWORD)
  // Future<ResponseOtpForgotPassword> otpForgotPassword(@Query("email") String email, @Query("otp_code") String otpCode);
  //
  // @GET(BASE_URL.OTP_RESET_PASSWORD)
  // Future<OtpRegisterResponse> otpRegister(@Query("otp_code") String otpCode);

  @GET(BASE_URL.FIRST_INTRODUCE)
  Future<IntroduceResponse> firstIntroduce();

  @GET(BASE_URL.GET_LOGO)
  Future<LogoResponse> getLogo();

  @GET(BASE_URL.GET_LIST_NEW)
  Future<ListNewsResponse> getListNews(@Query('pageSize') int pageSize, @Query('currentPage') int currentPage);

  @GET(BASE_URL.GET_LIST_DOCUMENTS)
  Future<ListDocumentsResponse> getListDocuments();

  @GET(BASE_URL.INTRODUCE)
  Future<IntroduceResponse> getIntroduce();

  @GET(BASE_URL.GET_LIST_COURSE)
  Future<CoursesResponse> getCourse();

  @GET(BASE_URL.LOGIN)
  Future<LoginResponse> getLoginApp(@Query('username') String username, @Query('password') String password, @Query('type') String type);

  @GET(BASE_URL.HOME)
  Future<HomeResponse> getHome();

  @GET(BASE_URL.HOME_INV)
  Future<HomeInvResponse> getHomeInv(@Query('page') int page ,@Query('numOfRecords') int numOfRecords);

  @GET(BASE_URL.HOME_OWN)
  Future<HomeOwnResponse> getHomeOwn();

  @GET(BASE_URL.CONTRACT_INV)
  Future<ContractInvResponse> getContractInv(@Query('page') int page ,@Query('numOfRecords') int numOfRecords);

  @GET(BASE_URL.TRANS)
  Future<TransResponse> getTrans(@Query('page') int page ,@Query('numOfRecords') int numOfRecords);

  @GET(BASE_URL.TRANS_OWN)
  Future<TransOwnResponse> getTransOwn(@Query('page') int page ,@Query('numOfRecords') int numOfRecords);

  @GET(BASE_URL.MONEY)
  Future<MoneyResponse> getMoney(@Query('page') int page ,@Query('numOfRecords') int numOfRecords);

  @GET(BASE_URL.MONEY_OWN)
  Future<MoneyOwnResponse> getMoneyOwn(@Query('page') int page ,@Query('numOfRecords') int numOfRecords);

  @GET(BASE_URL.UNREALIZED)
  Future<UnrealizedResponse> getUnrealized();

  @GET(BASE_URL.UNREALIZED_OWN)
  Future<UnrealizedOwnResponse> getUnrealizedOwn();

  @GET(BASE_URL.Sumunrealized)
  Future<SumunrealizedResponse> getSumunrealized();

  @GET(BASE_URL.Sumunrealized_OWN)
  Future<SumunrealizedOwnResponse> getSumunrealizedOwn();

  @GET(BASE_URL.Realized)
  Future<RealizedResponse> getRealized(@Query('page') int page ,@Query('numOfRecords') int numOfRecords);

  @GET(BASE_URL.Realized_OWN)
  Future<RealizedOwnResponse> getRealizedOwn();

  @GET(BASE_URL.Sumrealized)
  Future<SumrealizedResponse> getSumrealized();

  //doi link api
  @GET(BASE_URL.Sumrealized_OWN)
  Future<SumrealizedOwnResponse> getSumrealizedOwn();

  @GET(BASE_URL.profile)
  Future<ProfileResponse> getProfile();

  @GET(BASE_URL.profile_own)
  Future<ProfileResponse> getProfileOwn();

  @GET(BASE_URL.profile_inv)
  Future<ProfileResponse> getProfileInv();

  @GET(BASE_URL.CONTACT)
  Future<Contact> getContact();

  @GET(BASE_URL.PROVISO)
  Future<proviso> getProviso();

  @GET(BASE_URL.INFO)
  Future<Info> getInfo();

  @GET(BASE_URL.NOTI)
  Future<NotiResponse> getNoti(@Query('page') int page ,@Query('numOfRecords') int numOfRecords);


  @PUT(BASE_URL.CHANGE_PASSWORD)
  Future<BaseResponse> changePassword(@Body() ChangePassRequest changePassRequest);

  @POST(BASE_URL.READ_NOTI)
  Future<ReadNoti> readNoti(@Part(name: "id") String id);

  @POST(BASE_URL.EDIT_PROFILE)
  Future<UpdateProfile> changeProfile(
      @Part(name: "sendimage") File sendimage,
      @Part(name: 'email') String email,
      @Part(name: 'phoneNumber') String phoneNumber,
      @Part(name: 'dateOfBirth') String dateOfBirth,
      @Part(name: 'gender') String gender,
      @Part(name: 'address') String address,
      );

  @POST(BASE_URL.EDIT_PROFILE)
  Future<BaseResponse> changeProfileNoAvt(
      @Part(name: 'email') String email,
      @Part(name: 'phoneNumber') String phoneNumber,
      @Part(name: 'dateOfBirth') String dateOfBirth,
      @Part(name: 'gender') String gender,
      @Part(name: 'address') String address,
      );

  // =================================> POST <==================================
  // @POST(BASE_URL.LOGIN)
  // Future<LoginResponse> loginApp(@Body() LoginAppRequest loginAppRequest);
  //
}