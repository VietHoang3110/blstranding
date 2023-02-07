// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realized.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatatableRe _$DatatableReFromJson(Map<String, dynamic> json) => DatatableRe(
      id: json['id'] as String?,
      buyDate: json['buyDate'] as String?,
      code: json['code'] as String?,
      amount: json['amount'] as String?,
      buyPrice: json['buyPrice'] as String?,
      buyIntoMoney: json['buyIntoMoney'] as String?,
      buyFee: json['buyFee'] as String?,
      buyTotal: json['buyTotal'] as String?,
      sellDate: json['sellDate'] as String?,
      sellPrice: json['sellPrice'] as String?,
      sellIntoMoney: json['sellIntoMoney'] as String?,
      sellFee: json['sellFee'] as String?,
      sellTotal: json['sellTotal'] as String?,
      loanDate: json['loanDate'] as String?,
      loanFee: json['loanFee'] as String?,
      advanceMoneyDate: json['advanceMoneyDate'] as String?,
      advanceMoneyFee: json['advanceMoneyFee'] as String?,
      profit: json['profit'] as String?,
      percent: json['percent'] as String?,
    );

Map<String, dynamic> _$DatatableReToJson(DatatableRe instance) =>
    <String, dynamic>{
      'id': instance.id,
      'buyDate': instance.buyDate,
      'code': instance.code,
      'amount': instance.amount,
      'buyPrice': instance.buyPrice,
      'buyIntoMoney': instance.buyIntoMoney,
      'buyFee': instance.buyFee,
      'buyTotal': instance.buyTotal,
      'sellDate': instance.sellDate,
      'sellPrice': instance.sellPrice,
      'sellIntoMoney': instance.sellIntoMoney,
      'sellFee': instance.sellFee,
      'sellTotal': instance.sellTotal,
      'loanDate': instance.loanDate,
      'loanFee': instance.loanFee,
      'advanceMoneyDate': instance.advanceMoneyDate,
      'advanceMoneyFee': instance.advanceMoneyFee,
      'profit': instance.profit,
      'percent': instance.percent,
    };

TotalRe _$TotalReFromJson(Map<String, dynamic> json) => TotalRe(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$TotalReToJson(TotalRe instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

DataRealized _$DataRealizedFromJson(Map<String, dynamic> json) => DataRealized(
      (json['total'] as List<dynamic>?)
          ?.map((e) => TotalRe.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['rows'] as List<dynamic>?)
          ?.map((e) => DatatableRe.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['maxPage'] as String?,
    );

Map<String, dynamic> _$DataRealizedToJson(DataRealized instance) =>
    <String, dynamic>{
      'total': instance.total,
      'rows': instance.rows,
      'maxPage': instance.maxPage,
    };

RealizedResponse _$RealizedResponseFromJson(Map<String, dynamic> json) =>
    RealizedResponse(
      json['data'] == null
          ? null
          : DataRealized.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$RealizedResponseToJson(RealizedResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
