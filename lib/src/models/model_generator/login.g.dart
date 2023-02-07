// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      json['id'] as String?,
      json['nhom'] as String?,
      json['objId'] as String?,
      json['fullname'] as String?,
      json['token'] as String?,
      json['avatar'] as String?,
      json['email'] as String?,
      json['phoneNumber'] as String?,
      json['dob'] as String?,
      json['sex'] as String?,
      json['address'] as String?,
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'id': instance.id,
      'nhom': instance.nhom,
      'objId': instance.objId,
      'fullname': instance.fullname,
      'token': instance.token,
      'avatar': instance.avatar,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'dob': instance.dob,
      'sex': instance.sex,
      'address': instance.address,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['data'] == null
          ? null
          : Login.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
