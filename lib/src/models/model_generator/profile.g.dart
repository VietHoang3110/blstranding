// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      dob: json['dob'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      sex: json['sex'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'dob': instance.dob,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'sex': instance.sex,
      'avatar': instance.avatar,
    };

DataProfile _$DataProfileFromJson(Map<String, dynamic> json) => DataProfile(
      profile: (json['profile'] as List<dynamic>?)
          ?.map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$DataProfileToJson(DataProfile instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'type': instance.type,
    };

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      json['data'] == null
          ? null
          : DataProfile.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
