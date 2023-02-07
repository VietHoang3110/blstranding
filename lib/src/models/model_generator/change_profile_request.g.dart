// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeProfileRequest _$ChangeProfileRequestFromJson(
        Map<String, dynamic> json) =>
    ChangeProfileRequest(
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      gender: json['gender'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$ChangeProfileRequestToJson(
        ChangeProfileRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'address': instance.address,
    };
