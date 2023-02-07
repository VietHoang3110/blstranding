// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sumrealized.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatatableSumr _$DatatableSumrFromJson(Map<String, dynamic> json) =>
    DatatableSumr(
      code: json['code'] as String?,
      quantity: json['quantity'] as String?,
      buyPriceAgv: json['buyPriceAgv'] as String?,
      buyIntoMoney: json['buyIntoMoney'] as String?,
      buyFee: json['buyFee'] as String?,
      buyTotal: json['buyTotal'] as String?,
      sellPriceAgv: json['sellPriceAgv'] as String?,
      sellIntoMoney: json['sellIntoMoney'] as String?,
      sellFee: json['sellFee'] as String?,
      sellTotal: json['sellTotal'] as String?,
      loanFee: json['loanFee'] as String?,
      advanceFee: json['advanceFee'] as String?,
      profit: json['profit'] as String?,
      percent: json['percent'] as String?,
    );

Map<String, dynamic> _$DatatableSumrToJson(DatatableSumr instance) =>
    <String, dynamic>{
      'code': instance.code,
      'quantity': instance.quantity,
      'buyPriceAgv': instance.buyPriceAgv,
      'buyIntoMoney': instance.buyIntoMoney,
      'buyFee': instance.buyFee,
      'buyTotal': instance.buyTotal,
      'sellPriceAgv': instance.sellPriceAgv,
      'sellIntoMoney': instance.sellIntoMoney,
      'sellFee': instance.sellFee,
      'sellTotal': instance.sellTotal,
      'loanFee': instance.loanFee,
      'advanceFee': instance.advanceFee,
      'profit': instance.profit,
      'percent': instance.percent,
    };

TotalSumr _$TotalSumrFromJson(Map<String, dynamic> json) => TotalSumr(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$TotalSumrToJson(TotalSumr instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

DataSumrealized _$DataSumrealizedFromJson(Map<String, dynamic> json) =>
    DataSumrealized(
      (json['total'] as List<dynamic>?)
          ?.map((e) => TotalSumr.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['datatable'] as List<dynamic>?)
          ?.map((e) => DatatableSumr.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataSumrealizedToJson(DataSumrealized instance) =>
    <String, dynamic>{
      'total': instance.total,
      'datatable': instance.datatable,
    };

SumrealizedResponse _$SumrealizedResponseFromJson(Map<String, dynamic> json) =>
    SumrealizedResponse(
      json['data'] == null
          ? null
          : DataSumrealized.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$SumrealizedResponseToJson(
        SumrealizedResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
