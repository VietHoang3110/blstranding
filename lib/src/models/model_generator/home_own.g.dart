// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_own.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeOwnInfo _$HomeOwnInfoFromJson(Map<String, dynamic> json) => HomeOwnInfo(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$HomeOwnInfoToJson(HomeOwnInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

HomeOwnWiget _$HomeOwnWigetFromJson(Map<String, dynamic> json) => HomeOwnWiget(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$HomeOwnWigetToJson(HomeOwnWiget instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

HomeOwnList _$HomeOwnListFromJson(Map<String, dynamic> json) => HomeOwnList(
      json['mack'] as String?,
      json['ton'] as String?,
      json['giadongcua'] as String?,
      json['tienban'] as String?,
      json['tinhtrang'] as String?,
    );

Map<String, dynamic> _$HomeOwnListToJson(HomeOwnList instance) =>
    <String, dynamic>{
      'mack': instance.mack,
      'ton': instance.ton,
      'giadongcua': instance.giadongcua,
      'tienban': instance.tienban,
      'tinhtrang': instance.tinhtrang,
    };

HomeOwnData _$HomeOwnDataFromJson(Map<String, dynamic> json) => HomeOwnData(
      (json['homeWiget'] as List<dynamic>?)
          ?.map((e) => HomeOwnWiget.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['homeInfo'] as List<dynamic>?)
          ?.map((e) => HomeOwnInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['homeList'] as List<dynamic>?)
          ?.map((e) => HomeOwnList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeOwnDataToJson(HomeOwnData instance) =>
    <String, dynamic>{
      'homeWiget': instance.homeWiget,
      'homeInfo': instance.homeInfo,
      'homeList': instance.homeList,
    };

HomeOwnResponse _$HomeOwnResponseFromJson(Map<String, dynamic> json) =>
    HomeOwnResponse(
      json['data'] == null
          ? null
          : HomeOwnData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomeOwnResponseToJson(HomeOwnResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
