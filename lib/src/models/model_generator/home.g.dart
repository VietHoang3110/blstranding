// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeList _$HomeListFromJson(Map<String, dynamic> json) => HomeList(
      json['mack'] as String?,
      json['ton'] as String?,
      json['giadongcua'] as String?,
      json['tienban'] as String?,
      json['tinhtrang'] as String?,
      json['loinhuan'] as String?,
    );

Map<String, dynamic> _$HomeListToJson(HomeList instance) => <String, dynamic>{
      'mack': instance.mack,
      'ton': instance.ton,
      'giadongcua': instance.giadongcua,
      'tienban': instance.tienban,
      'tinhtrang': instance.tinhtrang,
      'loinhuan': instance.loinhuan,
    };

HomeOrder _$HomeOrderFromJson(Map<String, dynamic> json) => HomeOrder(
      json['so_luong'] as String?,
      json['gia'] as String?,
      json['sl_khop'] as String?,
      json['gia_khop'] as String?,
      json['mack'] as String?,
      json['giaodich'] as String?,
      json['giodat'] as String?,
      json['conlai'] as String?,
      json['giatrikhop'] as String?,
      json['tinhtrang'] as String?,
    );

Map<String, dynamic> _$HomeOrderToJson(HomeOrder instance) => <String, dynamic>{
      'so_luong': instance.soLuong,
      'gia': instance.gia,
      'sl_khop': instance.slKhop,
      'gia_khop': instance.giaKhop,
      'mack': instance.mack,
      'giaodich': instance.giaodich,
      'giodat': instance.giodat,
      'conlai': instance.conlai,
      'giatrikhop': instance.giatrikhop,
      'tinhtrang': instance.tinhtrang,
    };

HomeInfo _$HomeInfoFromJson(Map<String, dynamic> json) => HomeInfo(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$HomeInfoToJson(HomeInfo instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

HomeWiget _$HomeWigetFromJson(Map<String, dynamic> json) => HomeWiget(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$HomeWigetToJson(HomeWiget instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData(
      (json['homeWiget'] as List<dynamic>?)
          ?.map((e) => HomeWiget.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['homeInfo'] as List<dynamic>?)
          ?.map((e) => HomeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['homeOrder'] as List<dynamic>?)
          ?.map((e) => HomeOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['homeList'] as List<dynamic>?)
          ?.map((e) => HomeList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'homeWiget': instance.homeWiget,
      'homeInfo': instance.homeInfo,
      'homeOrder': instance.homeOrder,
      'homeList': instance.homeList,
    };

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      json['data'] == null
          ? null
          : HomeData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
