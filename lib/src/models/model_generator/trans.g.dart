// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransHistory _$TransHistoryFromJson(Map<String, dynamic> json) => TransHistory(
      date: json['date'] as String?,
      code: json['code'] as String?,
      sellAmount: json['sellAmount'] as String?,
      buyAmount: json['buyAmount'] as String?,
      sellPrice: json['sellPrice'] as String?,
      intoMoney: json['intoMoney'] as String?,
      provisional: json['provisional'] as String?,
      moneyBuy: json['moneyBuy'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$TransHistoryToJson(TransHistory instance) =>
    <String, dynamic>{
      'date': instance.date,
      'code': instance.code,
      'sellAmount': instance.sellAmount,
      'buyAmount': instance.buyAmount,
      'sellPrice': instance.sellPrice,
      'intoMoney': instance.intoMoney,
      'provisional': instance.provisional,
      'moneyBuy': instance.moneyBuy,
      'status': instance.status,
    };

Total _$TotalFromJson(Map<String, dynamic> json) => Total(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$TotalToJson(Total instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

DataTrans _$DataTransFromJson(Map<String, dynamic> json) => DataTrans(
      (json['total'] as List<dynamic>?)
          ?.map((e) => Total.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['rows'] as List<dynamic>?)
          ?.map((e) => TransHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['maxPage'] as String?,
    );

Map<String, dynamic> _$DataTransToJson(DataTrans instance) => <String, dynamic>{
      'total': instance.total,
      'rows': instance.rows,
      'maxPage': instance.maxPage,
    };

TransResponse _$TransResponseFromJson(Map<String, dynamic> json) =>
    TransResponse(
      json['data'] == null
          ? null
          : DataTrans.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$TransResponseToJson(TransResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
