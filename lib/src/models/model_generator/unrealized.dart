
import 'package:json_annotation/json_annotation.dart';

import '../index.dart';

part 'unrealized.g.dart';


@JsonSerializable()
class DatatableUn {
  String? id;
  String? code;
  String? amount;
  String? date;
  String? buyPrice;
  String? buyIntoMoney;
  String? buyFee;
  String? buyTotal;
  String? closePrice;
  String? limitPrice;
  String? provisional;
  String? sellFee;
  String? provisionalTotal;
  String? loanDate;
  String? loanFee;
  String? advanceMoneyDate;
  String? advanceMoneyFee;
  String? profit;
  String? percent;

  DatatableUn(
      {this.id,
        this.code,
        this.amount,
        this.date,
        this.buyPrice,
        this.buyIntoMoney,
        this.buyFee,
        this.buyTotal,
        this.closePrice,
        this.limitPrice,
        this.provisional,
        this.sellFee,
        this.provisionalTotal,
        this.loanDate,
        this.loanFee,
        this.advanceMoneyDate,
        this.advanceMoneyFee,
        this.profit,
        this.percent});
  factory DatatableUn.fromJson(Map<String, dynamic> json) => _$DatatableUnFromJson(json);
  Map<String, dynamic> toJson() => _$DatatableUnToJson(this);
}

@JsonSerializable()
class TotalUn {
  final String? name;
  final String? value;

  TotalUn(this.name, this.value);

  factory TotalUn.fromJson(Map<String, dynamic> json) => _$TotalUnFromJson(json);
  Map<String, dynamic> toJson() => _$TotalUnToJson(this);
}

@JsonSerializable()
class DataUnrealized {
  final List<TotalUn>? total;
  final List<DatatableUn>? dataTable;

  DataUnrealized(this.total, this.dataTable);

  factory DataUnrealized.fromJson(Map<String, dynamic> json) => _$DataUnrealizedFromJson(json);
  Map<String, dynamic> toJson() => _$DataUnrealizedToJson(this);
}


@JsonSerializable()
class UnrealizedResponse  extends BaseResponse{

  final DataUnrealized? data;

  UnrealizedResponse(this.data);

  factory UnrealizedResponse.fromJson(Map<String, dynamic> json) => _$UnrealizedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UnrealizedResponseToJson(this);
}
