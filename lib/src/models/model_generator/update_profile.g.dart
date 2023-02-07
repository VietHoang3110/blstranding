// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfile _$UpdateProfileFromJson(Map<String, dynamic> json) =>
    UpdateProfile(
      json['avatar'] as String?,
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$UpdateProfileToJson(UpdateProfile instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'avatar': instance.avatar,
    };
