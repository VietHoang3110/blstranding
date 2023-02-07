// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sumunrealized_own.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatatableSuOwn _$DatatableSuOwnFromJson(Map<String, dynamic> json) =>
    DatatableSuOwn(
      code: json['code'] as String?,
      amount: json['amount'] as String?,
      purchasePrice: json['purchasePrice'] as String?,
      intoMoney: json['intoMoney'] as String?,
      buyFee: json['buyFee'] as String?,
      total: json['total'] as String?,
      closePrice: json['closePrice'] as String?,
      limitPrice: json['limitPrice'] as String?,
      provisional: json['provisional'] as String?,
      purchaseSell: json['purchaseSell'] as String?,
      provisionalTotal: json['provisionalTotal'] as String?,
      loanFee: json['loanFee'] as String?,
      dvanceMoneyPurchase: json['dvanceMoneyPurchase'] as String?,
      profit: json['profit'] as String?,
      percent: json['percent'] as String?,
    );

Map<String, dynamic> _$DatatableSuOwnToJson(DatatableSuOwn instance) =>
    <String, dynamic>{
      'code': instance.code,
      'amount': instance.amount,
      'purchasePrice': instance.purchasePrice,
      'intoMoney': instance.intoMoney,
      'buyFee': instance.buyFee,
      'total': instance.total,
      'closePrice': instance.closePrice,
      'limitPrice': instance.limitPrice,
      'provisional': instance.provisional,
      'purchaseSell': instance.purchaseSell,
      'provisionalTotal': instance.provisionalTotal,
      'loanFee': instance.loanFee,
      'dvanceMoneyPurchase': instance.dvanceMoneyPurchase,
      'profit': instance.profit,
      'percent': instance.percent,
    };

TotalSuOwn _$TotalSuOwnFromJson(Map<String, dynamic> json) => TotalSuOwn(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$TotalSuOwnToJson(TotalSuOwn instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

DataSumunrealizedOwn _$DataSumunrealizedOwnFromJson(
        Map<String, dynamic> json) =>
    DataSumunrealizedOwn(
      (json['toTal'] as List<dynamic>?)
          ?.map((e) => TotalSuOwn.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['dataTable'] as List<dynamic>?)
          ?.map((e) => DatatableSuOwn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataSumunrealizedOwnToJson(
        DataSumunrealizedOwn instance) =>
    <String, dynamic>{
      'toTal': instance.toTal,
      'dataTable': instance.dataTable,
    };

SumunrealizedOwnResponse _$SumunrealizedOwnResponseFromJson(
        Map<String, dynamic> json) =>
    SumunrealizedOwnResponse(
      json['data'] == null
          ? null
          : DataSumunrealizedOwn.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$SumunrealizedOwnResponseToJson(
        SumunrealizedOwnResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
