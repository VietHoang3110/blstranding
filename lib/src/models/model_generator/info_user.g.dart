// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoUser _$InfoUserFromJson(Map<String, dynamic> json) => InfoUser(
      id: json['id'] as String?,
      nhom: json['nhom'] as String?,
      objId: json['objId'] as String?,
      fullname: json['fullname'] as String?,
      token: json['token'] as String?,
      email: json['email'] as String?,
      dob: json['dob'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      sex: json['sex'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$InfoUserToJson(InfoUser instance) => <String, dynamic>{
      'id': instance.id,
      'nhom': instance.nhom,
      'objId': instance.objId,
      'fullname': instance.fullname,
      'token': instance.token,
      'email': instance.email,
      'dob': instance.dob,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'sex': instance.sex,
      'avatar': instance.avatar,
    };
