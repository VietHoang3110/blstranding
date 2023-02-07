// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sumrealized_own.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatatableSumrOwn _$DatatableSumrOwnFromJson(Map<String, dynamic> json) =>
    DatatableSumrOwn(
      code: json['code'] as String?,
      quantity: json['quantity'] as String?,
      sellPriceAvg: json['sellPriceAvg'] as String?,
      sellMoney: json['sellMoney'] as String?,
      sellFee: json['sellFee'] as String?,
      sellTotal: json['sellTotal'] as String?,
      sellFeeAvg: json['sellFeeAvg'] as String?,
      buyMoney: json['buyMoney'] as String?,
      buyFee: json['buyFee'] as String?,
      buyTotal: json['buyTotal'] as String?,
      loanFee: json['loanFee'] as String?,
      advanceFee: json['advanceFee'] as String?,
      profit: json['profit'] as String?,
    );

Map<String, dynamic> _$DatatableSumrOwnToJson(DatatableSumrOwn instance) =>
    <String, dynamic>{
      'code': instance.code,
      'quantity': instance.quantity,
      'sellPriceAvg': instance.sellPriceAvg,
      'sellMoney': instance.sellMoney,
      'sellFee': instance.sellFee,
      'sellTotal': instance.sellTotal,
      'sellFeeAvg': instance.sellFeeAvg,
      'buyMoney': instance.buyMoney,
      'buyFee': instance.buyFee,
      'buyTotal': instance.buyTotal,
      'loanFee': instance.loanFee,
      'advanceFee': instance.advanceFee,
      'profit': instance.profit,
    };

TotalSumrOwn _$TotalSumrOwnFromJson(Map<String, dynamic> json) => TotalSumrOwn(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$TotalSumrOwnToJson(TotalSumrOwn instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

DataSumrealizedOwn _$DataSumrealizedOwnFromJson(Map<String, dynamic> json) =>
    DataSumrealizedOwn(
      (json['total'] as List<dynamic>?)
          ?.map((e) => TotalSumrOwn.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['datatable'] as List<dynamic>?)
          ?.map((e) => DatatableSumrOwn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataSumrealizedOwnToJson(DataSumrealizedOwn instance) =>
    <String, dynamic>{
      'total': instance.total,
      'datatable': instance.datatable,
    };

SumrealizedOwnResponse _$SumrealizedOwnResponseFromJson(
        Map<String, dynamic> json) =>
    SumrealizedOwnResponse(
      json['data'] == null
          ? null
          : DataSumrealizedOwn.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$SumrealizedOwnResponseToJson(
        SumrealizedOwnResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
