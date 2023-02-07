// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trans_own.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataTableTransOwn _$DataTableTransOwnFromJson(Map<String, dynamic> json) =>
    DataTableTransOwn(
      json['date'] as String?,
      json['code'] as String?,
      json['buyQuantity'] as String?,
      json['buyPrice'] as String?,
      json['buyTotal'] as String?,
      json['sellQuantity'] as String?,
      json['sellPrice'] as String?,
      json['sellTotal'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$DataTableTransOwnToJson(DataTableTransOwn instance) =>
    <String, dynamic>{
      'date': instance.date,
      'code': instance.code,
      'buyQuantity': instance.buyQuantity,
      'buyPrice': instance.buyPrice,
      'buyTotal': instance.buyTotal,
      'sellQuantity': instance.sellQuantity,
      'sellPrice': instance.sellPrice,
      'sellTotal': instance.sellTotal,
      'status': instance.status,
    };

TotalTransOwn _$TotalTransOwnFromJson(Map<String, dynamic> json) =>
    TotalTransOwn(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$TotalTransOwnToJson(TotalTransOwn instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

DataTransOwn _$DataTransOwnFromJson(Map<String, dynamic> json) => DataTransOwn(
      (json['total'] as List<dynamic>?)
          ?.map((e) => TotalTransOwn.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['dataTable'] as List<dynamic>?)
          ?.map((e) => DataTableTransOwn.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['maxPage'] as String?,
    );

Map<String, dynamic> _$DataTransOwnToJson(DataTransOwn instance) =>
    <String, dynamic>{
      'total': instance.total,
      'dataTable': instance.dataTable,
      'maxPage': instance.maxPage,
    };

TransOwnResponse _$TransOwnResponseFromJson(Map<String, dynamic> json) =>
    TransOwnResponse(
      json['data'] == null
          ? null
          : DataTransOwn.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$TransOwnResponseToJson(TransOwnResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
