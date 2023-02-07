// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_inv.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeInvList _$HomeInvListFromJson(Map<String, dynamic> json) => HomeInvList(
      id: json['id'] as String?,
      name: json['name'] as String?,
      investmentContractMoney: json['investmentContractMoney'] as String?,
      capitalContributionDate: json['capitalContributionDate'] as String?,
      profitRate: json['profitRate'] as String?,
      hasWithdrawnOrigin: json['hasWithdrawnOrigin'] as String?,
      hasWithdrawnInterest: json['hasWithdrawnInterest'] as String?,
      originSurplus: json['originSurplus'] as String?,
      numberDate: json['numberDate'] as String?,
      profitDate: json['profitDate'] as String?,
      provisionalProfit: json['provisionalProfit'] as String?,
    );

Map<String, dynamic> _$HomeInvListToJson(HomeInvList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'investmentContractMoney': instance.investmentContractMoney,
      'capitalContributionDate': instance.capitalContributionDate,
      'profitRate': instance.profitRate,
      'hasWithdrawnOrigin': instance.hasWithdrawnOrigin,
      'hasWithdrawnInterest': instance.hasWithdrawnInterest,
      'originSurplus': instance.originSurplus,
      'profitDate': instance.profitDate,
      'numberDate': instance.numberDate,
      'provisionalProfit': instance.provisionalProfit,
    };

HomeInvWiget _$HomeInvWigetFromJson(Map<String, dynamic> json) => HomeInvWiget(
      json['name'] as String?,
      json['value'] as String?,
    );

Map<String, dynamic> _$HomeInvWigetToJson(HomeInvWiget instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

HomeInvData _$HomeInvDataFromJson(Map<String, dynamic> json) => HomeInvData(
      (json['homeWiget'] as List<dynamic>?)
          ?.map((e) => HomeInvWiget.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['homeList'] as List<dynamic>?)
          ?.map((e) => HomeInvList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['totalMoney'] as String?,
      json['totalSurplus'] as String?,
      json['totalProfit'] as String?,
      json['maxPage'] as String?,
    );

Map<String, dynamic> _$HomeInvDataToJson(HomeInvData instance) =>
    <String, dynamic>{
      'homeWiget': instance.homeWiget,
      'homeList': instance.homeList,
      'maxPage': instance.maxPage,
      'totalMoney': instance.totalMoney,
      'totalSurplus': instance.totalSurplus,
      'totalProfit': instance.totalProfit,
    };

HomeInvResponse _$HomeInvResponseFromJson(Map<String, dynamic> json) =>
    HomeInvResponse(
      json['data'] == null
          ? null
          : HomeInvData.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomeInvResponseToJson(HomeInvResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
