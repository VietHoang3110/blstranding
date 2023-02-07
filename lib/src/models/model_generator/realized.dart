
import 'package:json_annotation/json_annotation.dart';

import '../index.dart';

part 'realized.g.dart';


@JsonSerializable()
class DatatableRe {
  String? id;
  String? buyDate;
  String? code;
  String? amount;
  String? buyPrice;
  String? buyIntoMoney;
  String? buyFee;
  String? buyTotal;
  String? sellDate;
  String? sellPrice;
  String? sellIntoMoney;
  String? sellFee;
  String? sellTotal;
  String? loanDate;
  String? loanFee;
  String? advanceMoneyDate;
  String? advanceMoneyFee;
  String? profit;
  String? percent;

  DatatableRe(
      {this.id,
        this.buyDate,
        this.code,
        this.amount,
        this.buyPrice,
        this.buyIntoMoney,
        this.buyFee,
        this.buyTotal,
        this.sellDate,
        this.sellPrice,
        this.sellIntoMoney,
        this.sellFee,
        this.sellTotal,
        this.loanDate,
        this.loanFee,
        this.advanceMoneyDate,
        this.advanceMoneyFee,
        this.profit,
        this.percent});
  factory DatatableRe.fromJson(Map<String, dynamic> json) => _$DatatableReFromJson(json);
  Map<String, dynamic> toJson() => _$DatatableReToJson(this);
}

@JsonSerializable()
class TotalRe {
  final String? name;
  final String? value;

  TotalRe(this.name, this.value);

  factory TotalRe.fromJson(Map<String, dynamic> json) => _$TotalReFromJson(json);
  Map<String, dynamic> toJson() => _$TotalReToJson(this);
}

@JsonSerializable()
class DataRealized {
  final List<TotalRe>? total;
  final List<DatatableRe>? rows;
  final String? maxPage;

  DataRealized(this.total, this.rows, this.maxPage);

  factory DataRealized.fromJson(Map<String, dynamic> json) => _$DataRealizedFromJson(json);
  Map<String, dynamic> toJson() => _$DataRealizedToJson(this);
}


@JsonSerializable()
class RealizedResponse  extends BaseResponse{

  final DataRealized? data;

  RealizedResponse(this.data);

  factory RealizedResponse.fromJson(Map<String, dynamic> json) => _$RealizedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RealizedResponseToJson(this);
}
