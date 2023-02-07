// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unrealized_own.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatatableUnOwn _$DatatableUnOwnFromJson(Map<String, dynamic> json) =>
    DatatableUnOwn(
      code: json['code'] as String?,
      amount: json['amount'] as String?,
      buyDate: json['buyDate'] as String?,
      buyPrice: json['buyPrice'] as String?,
      intoMoney: json['intoMoney'] as String?,
      purchaseFee: json['purchaseFee'] as String?,
      total: json['total'] as String?,
      closePrice: json['closePrice'] as String?,
      limitPrice: json['limitPrice'] as String?,
      provisional: json['provisional'] as String?,
      purchaseSell: json['purchaseSell'] as String?,
      provisionalTotal: json['provisionalTotal'] as String?,
      loanDate: json['loanDate'] as String?,
      loanFee: json['loanFee'] as String?,
      advanceMoneyDate: json['advanceMoneyDate'] as String?,
      dvanceMoneyPurchase: json['dvanceMoneyPurchase'] as String?,
      profit: json['profit'] as String?,
      percent: json['percent'] as String?,
    );

Map<String, dynamic> _$DatatableUnOwnToJson(DatatableUnOwn instance) =>
    <String, dynamic>{
      'code': instance.code,
      'amount': instance.amount,
      'buyDate': instance.buyDate,
      'buyPrice': instance.buyPrice,
      'intoMoney': instance.intoMoney,
      'purchaseFee': instance.purchaseFee,
      'total': instance.total,
      'closePrice': instance.closePrice,
      'limitPrice': instance.limitPrice,
      'provisional': instance.provisional,
      'purchaseSell': instance.purchaseSell,
      'provisionalTotal': instance.provisionalTotal,
      'loanDate': instance.loanDate,
      'loanFee': instance.loanFee,
      'advanceMoneyDate': instance.advanceMoneyDate,
      'dvanceMoneyPurchase': instance.dvanceMoneyPurchase,
      'profit': instance.profit,
      'percent': instance.percent,
    };

TotalUnOwn _$TotalUnOwnFromJson(Map<String, dynamic> json) => TotalUnOwn(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$TotalUnOwnToJson(TotalUnOwn instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

DataUnrealizedOwn _$DataUnrealizedOwnFromJson(Map<String, dynamic> json) =>
    DataUnrealizedOwn(
      (json['toTal'] as List<dynamic>?)
          ?.map((e) => TotalUnOwn.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['dataTable'] as List<dynamic>?)
          ?.map((e) => DatatableUnOwn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataUnrealizedOwnToJson(DataUnrealizedOwn instance) =>
    <String, dynamic>{
      'toTal': instance.toTal,
      'dataTable': instance.dataTable,
    };

UnrealizedOwnResponse _$UnrealizedOwnResponseFromJson(
        Map<String, dynamic> json) =>
    UnrealizedOwnResponse(
      json['data'] == null
          ? null
          : DataUnrealizedOwn.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$UnrealizedOwnResponseToJson(
        UnrealizedOwnResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
