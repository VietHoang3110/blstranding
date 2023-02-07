
import 'package:json_annotation/json_annotation.dart';

import '../index.dart';

part 'sumrealized_own.g.dart';


@JsonSerializable()
class DatatableSumrOwn {
  String? code;
  String? quantity;
  String? sellPriceAvg;
  String? sellMoney;
  String? sellFee;
  String? sellTotal;
  String? sellFeeAvg;
  String? buyMoney;
  String? buyFee;
  String? buyTotal;
  String? loanFee;
  String? advanceFee;
  String? profit;

  DatatableSumrOwn(
      {this.code,
        this.quantity,
        this.sellPriceAvg,
        this.sellMoney,
        this.sellFee,
        this.sellTotal,
        this.sellFeeAvg,
        this.buyMoney,
        this.buyFee,
        this.buyTotal,
        this.loanFee,
        this.advanceFee,
        this.profit});
  factory DatatableSumrOwn.fromJson(Map<String, dynamic> json) => _$DatatableSumrOwnFromJson(json);
  Map<String, dynamic> toJson() => _$DatatableSumrOwnToJson(this);
}

@JsonSerializable()
class TotalSumrOwn {
  final String? name;
  final String? value;

  TotalSumrOwn(this.name, this.value);

  factory TotalSumrOwn.fromJson(Map<String, dynamic> json) => _$TotalSumrOwnFromJson(json);
  Map<String, dynamic> toJson() => _$TotalSumrOwnToJson(this);
}

@JsonSerializable()
class DataSumrealizedOwn {
  final List<TotalSumrOwn>? total;
  final List<DatatableSumrOwn>? datatable;

  DataSumrealizedOwn(this.total, this.datatable);

  factory DataSumrealizedOwn.fromJson(Map<String, dynamic> json) => _$DataSumrealizedOwnFromJson(json);
  Map<String, dynamic> toJson() => _$DataSumrealizedOwnToJson(this);
}


@JsonSerializable()
class SumrealizedOwnResponse  extends BaseResponse{

  final DataSumrealizedOwn? data;

  SumrealizedOwnResponse(this.data);

  factory SumrealizedOwnResponse.fromJson(Map<String, dynamic> json) => _$SumrealizedOwnResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SumrealizedOwnResponseToJson(this);
}
