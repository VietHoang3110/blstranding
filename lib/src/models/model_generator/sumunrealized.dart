
import 'package:json_annotation/json_annotation.dart';

import '../index.dart';

part 'sumunrealized.g.dart';


@JsonSerializable()
class DatatableSu {
  String? code;
  String? amount;
  String? averagePrice;
  String? buyMoney;
  String? feeBuy;
  String? totalMoneyBuy;
  String? closingPrice;
  String? limitPrice;
  String? tolalMoneyBuy;
  String? feeSell;
  String? totalMoneySell;
  String? feeLoan;
  String? advanceMoneyFee;
  String? profit;
  String? percent;

  DatatableSu(
      {this.code,
        this.amount,
        this.averagePrice,
        this.buyMoney,
        this.feeBuy,
        this.totalMoneyBuy,
        this.closingPrice,
        this.limitPrice,
        this.tolalMoneyBuy,
        this.feeSell,
        this.totalMoneySell,
        this.feeLoan,
        this.advanceMoneyFee,
        this.profit,
        this.percent});
  factory DatatableSu.fromJson(Map<String, dynamic> json) => _$DatatableSuFromJson(json);
  Map<String, dynamic> toJson() => _$DatatableSuToJson(this);
}

@JsonSerializable()
class TotalSu {
  final String? name;
  final String? value;

  TotalSu(this.name, this.value);

  factory TotalSu.fromJson(Map<String, dynamic> json) => _$TotalSuFromJson(json);
  Map<String, dynamic> toJson() => _$TotalSuToJson(this);
}

@JsonSerializable()
class DataSumunrealized {
  final List<TotalSu>? total;
  final List<DatatableSu>? rows;

  DataSumunrealized(this.total, this.rows);

  factory DataSumunrealized.fromJson(Map<String, dynamic> json) => _$DataSumunrealizedFromJson(json);
  Map<String, dynamic> toJson() => _$DataSumunrealizedToJson(this);
}


@JsonSerializable()
class SumunrealizedResponse  extends BaseResponse{

  final DataSumunrealized? data;

  SumunrealizedResponse(this.data);

  factory SumunrealizedResponse.fromJson(Map<String, dynamic> json) => _$SumunrealizedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SumunrealizedResponseToJson(this);
}
