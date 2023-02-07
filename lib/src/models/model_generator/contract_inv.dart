
import 'package:json_annotation/json_annotation.dart';
import 'package:quan_ly/src/models/model_generator/trans.dart';

import '../index.dart';

part 'contract_inv.g.dart';


@JsonSerializable()
class RowsInv {
  String? numContract;
  String? initialMoney;
  String? capitalContributionDate;
  String? profitRate;
  String? profitCalculationDate;
  String? profit;
  String? settlementDate;


  RowsInv(
      {this.numContract,
        this.initialMoney,
        this.settlementDate,
        this.capitalContributionDate,
        this.profitRate,
        this.profitCalculationDate,
        this.profit});

  factory RowsInv.fromJson(Map<String, dynamic> json) => _$RowsInvFromJson(json);
  Map<String, dynamic> toJson() => _$RowsInvToJson(this);
}

@JsonSerializable()
class TotalInv {
  final String? name;
  final String? value;

  TotalInv(this.name, this.value);

  factory TotalInv.fromJson(Map<String, dynamic> json) => _$TotalInvFromJson(json);
  Map<String, dynamic> toJson() => _$TotalInvToJson(this);
}

@JsonSerializable()
class ContractInv {
  final List<TotalInv>? total;
  final List<RowsInv>? rows;
  final String? maxPage;
  final String? totalMoney;
  final String? totalProfit;

  ContractInv(this.total, this.rows, this.totalMoney, this.totalProfit, this.maxPage);

  factory ContractInv.fromJson(Map<String, dynamic> json) => _$ContractInvFromJson(json);
  Map<String, dynamic> toJson() => _$ContractInvToJson(this);
}


@JsonSerializable()
class ContractInvResponse  extends BaseResponse{

  final ContractInv? data;

  ContractInvResponse(this.data);

  factory ContractInvResponse.fromJson(Map<String, dynamic> json) => _$ContractInvResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContractInvResponseToJson(this);
}
