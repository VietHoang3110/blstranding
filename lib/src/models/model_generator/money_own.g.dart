// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_own.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataTableMoneyOwn _$DataTableMoneyOwnFromJson(Map<String, dynamic> json) =>
    DataTableMoneyOwn(
      json['id'] as String?,
      json['date'] as String?,
      json['description'] as String?,
      json['cashIn'] as String?,
      json['cashOut'] as String?,
    );

Map<String, dynamic> _$DataTableMoneyOwnToJson(DataTableMoneyOwn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'description': instance.description,
      'cashIn': instance.cashIn,
      'cashOut': instance.cashOut,
    };

Total _$TotalFromJson(Map<String, dynamic> json) => Total(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$TotalToJson(Total instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

DataMoneyOwn _$DataMoneyOwnFromJson(Map<String, dynamic> json) => DataMoneyOwn(
      (json['total'] as List<dynamic>?)
          ?.map((e) => Total.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['datatable'] as List<dynamic>?)
          ?.map((e) => DataTableMoneyOwn.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['maxPage'] as String?,
    );

Map<String, dynamic> _$DataMoneyOwnToJson(DataMoneyOwn instance) =>
    <String, dynamic>{
      'total': instance.total,
      'datatable': instance.datatable,
      'maxPage': instance.maxPage,
    };

MoneyOwnResponse _$MoneyOwnResponseFromJson(Map<String, dynamic> json) =>
    MoneyOwnResponse(
      json['data'] == null
          ? null
          : DataMoneyOwn.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MoneyOwnResponseToJson(MoneyOwnResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
