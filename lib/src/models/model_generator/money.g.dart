// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RowsMoney _$RowsMoneyFromJson(Map<String, dynamic> json) => RowsMoney(
      id: json['id'] as String?,
      date: json['date'] as String?,
      description: json['description'] as String?,
      cashIn: json['cashIn'] as String?,
      cashOut: json['cashOut'] as String?,
      typeTransction: json['typeTransction'] as String?,
      number: json['number'] as int?,
    );

Map<String, dynamic> _$RowsMoneyToJson(RowsMoney instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'description': instance.description,
      'cashIn': instance.cashIn,
      'cashOut': instance.cashOut,
      'typeTransction': instance.typeTransction,
      'number': instance.number,
    };

TotalMoney _$TotalMoneyFromJson(Map<String, dynamic> json) => TotalMoney(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$TotalMoneyToJson(TotalMoney instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

DataMoney _$DataMoneyFromJson(Map<String, dynamic> json) => DataMoney(
      total: (json['total'] as List<dynamic>?)
          ?.map((e) => TotalMoney.fromJson(e as Map<String, dynamic>))
          .toList(),
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => RowsMoney.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxPage: json['maxPage'] as String?,
    );

Map<String, dynamic> _$DataMoneyToJson(DataMoney instance) => <String, dynamic>{
      'total': instance.total,
      'rows': instance.rows,
      'maxPage': instance.maxPage,
    };

MoneyResponse _$MoneyResponseFromJson(Map<String, dynamic> json) =>
    MoneyResponse(
      json['data'] == null
          ? null
          : DataMoney.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MoneyResponseToJson(MoneyResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
