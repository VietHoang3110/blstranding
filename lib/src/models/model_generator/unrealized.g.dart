// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unrealized.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatatableUn _$DatatableUnFromJson(Map<String, dynamic> json) => DatatableUn(
      id: json['id'] as String?,
      code: json['code'] as String?,
      amount: json['amount'] as String?,
      date: json['date'] as String?,
      buyPrice: json['buyPrice'] as String?,
      buyIntoMoney: json['buyIntoMoney'] as String?,
      buyFee: json['buyFee'] as String?,
      buyTotal: json['buyTotal'] as String?,
      closePrice: json['closePrice'] as String?,
      limitPrice: json['limitPrice'] as String?,
      provisional: json['provisional'] as String?,
      sellFee: json['sellFee'] as String?,
      provisionalTotal: json['provisionalTotal'] as String?,
      loanDate: json['loanDate'] as String?,
      loanFee: json['loanFee'] as String?,
      advanceMoneyDate: json['advanceMoneyDate'] as String?,
      advanceMoneyFee: json['advanceMoneyFee'] as String?,
      profit: json['profit'] as String?,
      percent: json['percent'] as String?,
    );

Map<String, dynamic> _$DatatableUnToJson(DatatableUn instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'amount': instance.amount,
      'date': instance.date,
      'buyPrice': instance.buyPrice,
      'buyIntoMoney': instance.buyIntoMoney,
      'buyFee': instance.buyFee,
      'buyTotal': instance.buyTotal,
      'closePrice': instance.closePrice,
      'limitPrice': instance.limitPrice,
      'provisional': instance.provisional,
      'sellFee': instance.sellFee,
      'provisionalTotal': instance.provisionalTotal,
      'loanDate': instance.loanDate,
      'loanFee': instance.loanFee,
      'advanceMoneyDate': instance.advanceMoneyDate,
      'advanceMoneyFee': instance.advanceMoneyFee,
      'profit': instance.profit,
      'percent': instance.percent,
    };

TotalUn _$TotalUnFromJson(Map<String, dynamic> json) => TotalUn(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$TotalUnToJson(TotalUn instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

DataUnrealized _$DataUnrealizedFromJson(Map<String, dynamic> json) =>
    DataUnrealized(
      (json['total'] as List<dynamic>?)
          ?.map((e) => TotalUn.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['dataTable'] as List<dynamic>?)
          ?.map((e) => DatatableUn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataUnrealizedToJson(DataUnrealized instance) =>
    <String, dynamic>{
      'total': instance.total,
      'dataTable': instance.dataTable,
    };

UnrealizedResponse _$UnrealizedResponseFromJson(Map<String, dynamic> json) =>
    UnrealizedResponse(
      json['data'] == null
          ? null
          : DataUnrealized.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$UnrealizedResponseToJson(UnrealizedResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
