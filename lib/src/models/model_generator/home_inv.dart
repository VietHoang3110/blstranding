
import 'package:json_annotation/json_annotation.dart';

import '../index.dart';

part 'home_inv.g.dart';

@JsonSerializable()
class HomeInvList {
  String? id;
  String? name;
  String? investmentContractMoney;
  String? capitalContributionDate;
  String? profitRate;
  String? hasWithdrawnOrigin;
  String? hasWithdrawnInterest;
  String? originSurplus;
  String? profitDate;
  String? numberDate;
  String? provisionalProfit;

  HomeInvList(
      {this.id,
        this.name,
        this.investmentContractMoney,
        this.capitalContributionDate,
        this.profitRate,
        this.hasWithdrawnOrigin,
        this.hasWithdrawnInterest,
        this.originSurplus,
        this.numberDate,
        this.profitDate,
        this.provisionalProfit});

  factory HomeInvList.fromJson(Map<String, dynamic> json) => _$HomeInvListFromJson(json);
  Map<String, dynamic> toJson() => _$HomeInvListToJson(this);
}


@JsonSerializable()
class HomeInvWiget {
  final String? name;
  final String? value;

  HomeInvWiget(this.name, this.value);

  factory HomeInvWiget.fromJson(Map<String, dynamic> json) => _$HomeInvWigetFromJson(json);
  Map<String, dynamic> toJson() => _$HomeInvWigetToJson(this);
}

@JsonSerializable()
class HomeInvData {
  final List<HomeInvWiget>? homeWiget;
  final List<HomeInvList>? homeList;
  final String? maxPage;
  final String? totalMoney;
  final String? totalSurplus;
  final String? totalProfit;


  HomeInvData(this.homeWiget, this.homeList, this.totalMoney, this.totalSurplus, this.totalProfit,this.maxPage);

  factory HomeInvData.fromJson(Map<String, dynamic> json) => _$HomeInvDataFromJson(json);
  Map<String, dynamic> toJson() => _$HomeInvDataToJson(this);
}


@JsonSerializable()
class HomeInvResponse  extends BaseResponse{

  HomeInvData? data;

  HomeInvResponse(this.data);

  factory HomeInvResponse.fromJson(Map<String, dynamic> json) => _$HomeInvResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeInvResponseToJson(this);
}
