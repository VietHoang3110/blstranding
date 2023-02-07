
import 'package:json_annotation/json_annotation.dart';

import '../index.dart';

part 'unrealized_own.g.dart';


@JsonSerializable()
class DatatableUnOwn {
  String? code;
  String? amount;
  String? buyDate;
  String? buyPrice;
  String? intoMoney;
  String? purchaseFee;
  String? total;
  String? closePrice;
  String? limitPrice;
  String? provisional;
  String? purchaseSell;
  String? provisionalTotal;
  String? loanDate;
  String? loanFee;
  String? advanceMoneyDate;
  String? dvanceMoneyPurchase;
  String? profit;
  String? percent;

  DatatableUnOwn(
      {this.code,
        this.amount,
        this.buyDate,
        this.buyPrice,
        this.intoMoney,
        this.purchaseFee,
        this.total,
        this.closePrice,
        this.limitPrice,
        this.provisional,
        this.purchaseSell,
        this.provisionalTotal,
        this.loanDate,
        this.loanFee,
        this.advanceMoneyDate,
        this.dvanceMoneyPurchase,
        this.profit,
        this.percent});
  factory DatatableUnOwn.fromJson(Map<String, dynamic> json) => _$DatatableUnOwnFromJson(json);
  Map<String, dynamic> toJson() => _$DatatableUnOwnToJson(this);
}

@JsonSerializable()
class TotalUnOwn {
  final String? name;
  final String? value;

  TotalUnOwn(this.name, this.value);

  factory TotalUnOwn.fromJson(Map<String, dynamic> json) => _$TotalUnOwnFromJson(json);
  Map<String, dynamic> toJson() => _$TotalUnOwnToJson(this);
}

@JsonSerializable()
class DataUnrealizedOwn {
  final List<TotalUnOwn>? toTal;
  final List<DatatableUnOwn>? dataTable;

  DataUnrealizedOwn(this.toTal, this.dataTable);

  factory DataUnrealizedOwn.fromJson(Map<String, dynamic> json) => _$DataUnrealizedOwnFromJson(json);
  Map<String, dynamic> toJson() => _$DataUnrealizedOwnToJson(this);
}


@JsonSerializable()
class UnrealizedOwnResponse  extends BaseResponse{

  final DataUnrealizedOwn? data;

  UnrealizedOwnResponse(this.data);

  factory UnrealizedOwnResponse.fromJson(Map<String, dynamic> json) => _$UnrealizedOwnResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnrealizedOwnResponseToJson(this);
}
