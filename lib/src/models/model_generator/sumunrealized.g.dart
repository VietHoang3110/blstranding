// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sumunrealized.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatatableSu _$DatatableSuFromJson(Map<String, dynamic> json) => DatatableSu(
      code: json['code'] as String?,
      amount: json['amount'] as String?,
      averagePrice: json['averagePrice'] as String?,
      buyMoney: json['buyMoney'] as String?,
      feeBuy: json['feeBuy'] as String?,
      totalMoneyBuy: json['totalMoneyBuy'] as String?,
      closingPrice: json['closingPrice'] as String?,
      limitPrice: json['limitPrice'] as String?,
      tolalMoneyBuy: json['tolalMoneyBuy'] as String?,
      feeSell: json['feeSell'] as String?,
      totalMoneySell: json['totalMoneySell'] as String?,
      feeLoan: json['feeLoan'] as String?,
      advanceMoneyFee: json['advanceMoneyFee'] as String?,
      profit: json['profit'] as String?,
      percent: json['percent'] as String?,
    );

Map<String, dynamic> _$DatatableSuToJson(DatatableSu instance) =>
    <String, dynamic>{
      'code': instance.code,
      'amount': instance.amount,
      'averagePrice': instance.averagePrice,
      'buyMoney': instance.buyMoney,
      'feeBuy': instance.feeBuy,
      'totalMoneyBuy': instance.totalMoneyBuy,
      'closingPrice': instance.closingPrice,
      'limitPrice': instance.limitPrice,
      'tolalMoneyBuy': instance.tolalMoneyBuy,
      'feeSell': instance.feeSell,
      'totalMoneySell': instance.totalMoneySell,
      'feeLoan': instance.feeLoan,
      'advanceMoneyFee': instance.advanceMoneyFee,
      'profit': instance.profit,
      'percent': instance.percent,
    };

TotalSu _$TotalSuFromJson(Map<String, dynamic> json) => TotalSu(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$TotalSuToJson(TotalSu instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

DataSumunrealized _$DataSumunrealizedFromJson(Map<String, dynamic> json) =>
    DataSumunrealized(
      (json['total'] as List<dynamic>?)
          ?.map((e) => TotalSu.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['rows'] as List<dynamic>?)
          ?.map((e) => DatatableSu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataSumunrealizedToJson(DataSumunrealized instance) =>
    <String, dynamic>{
      'total': instance.total,
      'rows': instance.rows,
    };

SumunrealizedResponse _$SumunrealizedResponseFromJson(
        Map<String, dynamic> json) =>
    SumunrealizedResponse(
      json['data'] == null
          ? null
          : DataSumunrealized.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$SumunrealizedResponseToJson(
        SumunrealizedResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
