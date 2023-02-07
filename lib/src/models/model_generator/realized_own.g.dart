// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realized_own.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DatatableReOwn _$DatatableReOwnFromJson(Map<String, dynamic> json) =>
    DatatableReOwn(
      code: json['code'] as String?,
      date: json['date'] as String?,
      amount: json['amount'] as String?,
      purchasePrice: json['purchasePrice'] as String?,
      provisional: json['provisional'] as String?,
      purchaseSell: json['purchaseSell'] as String?,
      provisionalTotal: json['provisionalTotal'] as String?,
      dateBuy: json['dateBuy'] as String?,
      purchaseBuy: json['purchaseBuy'] as String?,
      intoMoney: json['intoMoney'] as String?,
      buyFee: json['buyFee'] as String?,
      total: json['total'] as String?,
      loanDate: json['loanDate'] as int?,
      dateApplication: json['dateApplication'] as String?,
      loanFee: json['loanFee'] as String?,
      dvanceMoneyPurchase: json['dvanceMoneyPurchase'] as String?,
      profit: json['profit'] as String?,
    );

Map<String, dynamic> _$DatatableReOwnToJson(DatatableReOwn instance) =>
    <String, dynamic>{
      'code': instance.code,
      'date': instance.date,
      'amount': instance.amount,
      'purchasePrice': instance.purchasePrice,
      'provisional': instance.provisional,
      'purchaseSell': instance.purchaseSell,
      'provisionalTotal': instance.provisionalTotal,
      'dateBuy': instance.dateBuy,
      'purchaseBuy': instance.purchaseBuy,
      'intoMoney': instance.intoMoney,
      'buyFee': instance.buyFee,
      'total': instance.total,
      'loanDate': instance.loanDate,
      'dateApplication': instance.dateApplication,
      'loanFee': instance.loanFee,
      'dvanceMoneyPurchase': instance.dvanceMoneyPurchase,
      'profit': instance.profit,
    };

TotalReOwn _$TotalReOwnFromJson(Map<String, dynamic> json) => TotalReOwn(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$TotalReOwnToJson(TotalReOwn instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

DataRealizedOwn _$DataRealizedOwnFromJson(Map<String, dynamic> json) =>
    DataRealizedOwn(
      (json['total'] as List<dynamic>?)
          ?.map((e) => TotalReOwn.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['rows'] as List<dynamic>?)
          ?.map((e) => DatatableReOwn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataRealizedOwnToJson(DataRealizedOwn instance) =>
    <String, dynamic>{
      'total': instance.total,
      'rows': instance.rows,
    };

RealizedOwnResponse _$RealizedOwnResponseFromJson(Map<String, dynamic> json) =>
    RealizedOwnResponse(
      json['data'] == null
          ? null
          : DataRealizedOwn.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$RealizedOwnResponseToJson(
        RealizedOwnResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
