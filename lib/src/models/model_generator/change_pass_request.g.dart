// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_pass_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePassRequest _$ChangePassRequestFromJson(Map<String, dynamic> json) =>
    ChangePassRequest(
      json['oldPassword'] as String,
      json['newPassword'] as String,
      json['confirmPassword'] as String,
    );

Map<String, dynamic> _$ChangePassRequestToJson(ChangePassRequest instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
      'confirmPassword': instance.confirmPassword,
    };
