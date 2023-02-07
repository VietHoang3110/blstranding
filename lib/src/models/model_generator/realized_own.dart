
import 'package:json_annotation/json_annotation.dart';

import '../index.dart';

part 'realized_own.g.dart';


@JsonSerializable()
class DatatableReOwn {
  String? code;
  String? date;
  String? amount;
  String? purchasePrice;
  String? provisional;
  String? purchaseSell;
  String? provisionalTotal;
  String? dateBuy;
  String? purchaseBuy;
  String? intoMoney;
  String? buyFee;
  String? total;
  int? loanDate;
  String? dateApplication;
  String? loanFee;
  String? dvanceMoneyPurchase;
  String? profit;

  DatatableReOwn(
      {this.code,
        this.date,
        this.amount,
        this.purchasePrice,
        this.provisional,
        this.purchaseSell,
        this.provisionalTotal,
        this.dateBuy,
        this.purchaseBuy,
        this.intoMoney,
        this.buyFee,
        this.total,
        this.loanDate,
        this.dateApplication,
        this.loanFee,
        this.dvanceMoneyPurchase,
        this.profit});

  factory DatatableReOwn.fromJson(Map<String, dynamic> json) => _$DatatableReOwnFromJson(json);
  Map<String, dynamic> toJson() => _$DatatableReOwnToJson(this);
}

@JsonSerializable()
class TotalReOwn {
  final String? name;
  final String? value;

  TotalReOwn(this.name, this.value);

  factory TotalReOwn.fromJson(Map<String, dynamic> json) => _$TotalReOwnFromJson(json);
  Map<String, dynamic> toJson() => _$TotalReOwnToJson(this);
}

@JsonSerializable()
class DataRealizedOwn {
  final List<TotalReOwn>? total;
  final List<DatatableReOwn>? rows;

  DataRealizedOwn(this.total, this.rows);

  factory DataRealizedOwn.fromJson(Map<String, dynamic> json) => _$DataRealizedOwnFromJson(json);
  Map<String, dynamic> toJson() => _$DataRealizedOwnToJson(this);
}


@JsonSerializable()
class RealizedOwnResponse  extends BaseResponse{

  final DataRealizedOwn? data;

  RealizedOwnResponse(this.data);

  factory RealizedOwnResponse.fromJson(Map<String, dynamic> json) => _$RealizedOwnResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RealizedOwnResponseToJson(this);
}
