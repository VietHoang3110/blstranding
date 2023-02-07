
import 'package:json_annotation/json_annotation.dart';

import '../index.dart';

part 'sumunrealized_own.g.dart';


@JsonSerializable()
class DatatableSuOwn {
  String? code;
  String? amount;
  String? purchasePrice;
  String? intoMoney;
  String? buyFee;
  String? total;
  String? closePrice;
  String? limitPrice;
  String? provisional;
  String? purchaseSell;
  String? provisionalTotal;
  String? loanFee;
  String? dvanceMoneyPurchase;
  String? profit;
  String? percent;

  DatatableSuOwn(
      {this.code,
        this.amount,
        this.purchasePrice,
        this.intoMoney,
        this.buyFee,
        this.total,
        this.closePrice,
        this.limitPrice,
        this.provisional,
        this.purchaseSell,
        this.provisionalTotal,
        this.loanFee,
        this.dvanceMoneyPurchase,
        this.profit,
        this.percent});
  factory DatatableSuOwn.fromJson(Map<String, dynamic> json) => _$DatatableSuOwnFromJson(json);
  Map<String, dynamic> toJson() => _$DatatableSuOwnToJson(this);
}

@JsonSerializable()
class TotalSuOwn {
  final String? name;
  final String? value;

  TotalSuOwn(this.name, this.value);

  factory TotalSuOwn.fromJson(Map<String, dynamic> json) => _$TotalSuOwnFromJson(json);
  Map<String, dynamic> toJson() => _$TotalSuOwnToJson(this);
}

@JsonSerializable()
class DataSumunrealizedOwn {
  final List<TotalSuOwn>? toTal;
  final List<DatatableSuOwn>? dataTable;

  DataSumunrealizedOwn(this.toTal, this.dataTable);

  factory DataSumunrealizedOwn.fromJson(Map<String, dynamic> json) => _$DataSumunrealizedOwnFromJson(json);
  Map<String, dynamic> toJson() => _$DataSumunrealizedOwnToJson(this);
}


@JsonSerializable()
class SumunrealizedOwnResponse  extends BaseResponse{

  final DataSumunrealizedOwn? data;

  SumunrealizedOwnResponse(this.data);

  factory SumunrealizedOwnResponse.fromJson(Map<String, dynamic> json) => _$SumunrealizedOwnResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SumunrealizedOwnResponseToJson(this);
}
