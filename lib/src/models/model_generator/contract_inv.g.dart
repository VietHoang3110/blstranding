// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_inv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RowsInv _$RowsInvFromJson(Map<String, dynamic> json) => RowsInv(
      numContract: json['numContract'] as String?,
      initialMoney: json['initialMoney'] as String?,
      settlementDate: json['settlementDate'] as String?,
      capitalContributionDate: json['capitalContributionDate'] as String?,
      profitRate: json['profitRate'] as String?,
      profitCalculationDate: json['profitCalculationDate'] as String?,
      profit: json['profit'] as String?,
    );

Map<String, dynamic> _$RowsInvToJson(RowsInv instance) => <String, dynamic>{
      'numContract': instance.numContract,
      'initialMoney': instance.initialMoney,
      'capitalContributionDate': instance.capitalContributionDate,
      'profitRate': instance.profitRate,
      'profitCalculationDate': instance.profitCalculationDate,
      'profit': instance.profit,
      'settlementDate': instance.settlementDate,
    };

TotalInv _$TotalInvFromJson(Map<String, dynamic> json) => TotalInv(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$TotalInvToJson(TotalInv instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

ContractInv _$ContractInvFromJson(Map<String, dynamic> json) => ContractInv(
      (json['total'] as List<dynamic>?)
          ?.map((e) => TotalInv.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['rows'] as List<dynamic>?)
          ?.map((e) => RowsInv.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['totalMoney'] as String?,
      json['totalProfit'] as String?,
      json['maxPage'] as String?,
    );

Map<String, dynamic> _$ContractInvToJson(ContractInv instance) =>
    <String, dynamic>{
      'total': instance.total,
      'rows': instance.rows,
      'maxPage': instance.maxPage,
      'totalMoney': instance.totalMoney,
      'totalProfit': instance.totalProfit,
    };

ContractInvResponse _$ContractInvResponseFromJson(Map<String, dynamic> json) =>
    ContractInvResponse(
      json['data'] == null
          ? null
          : ContractInv.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ContractInvResponseToJson(
        ContractInvResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
