// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseStatus _$ResponseStatusFromJson(Map<String, dynamic> json) =>
    ResponseStatus(
      code: json['code'] as int,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ResponseStatusToJson(ResponseStatus instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

ResponseDataStatus _$ResponseDataStatusFromJson(Map<String, dynamic> json) =>
    ResponseDataStatus(
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : InfoUser.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ResponseDataStatusToJson(ResponseDataStatus instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
    };

ResponseOtpForgotPassword _$ResponseOtpForgotPasswordFromJson(
        Map<String, dynamic> json) =>
    ResponseOtpForgotPassword(
      code: json['code'] as int?,
      payload: json['payload'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ResponseOtpForgotPasswordToJson(
        ResponseOtpForgotPassword instance) =>
    <String, dynamic>{
      'code': instance.code,
      'payload': instance.payload,
      'message': instance.message,
    };
