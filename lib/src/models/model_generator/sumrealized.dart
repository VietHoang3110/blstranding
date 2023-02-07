
import 'package:json_annotation/json_annotation.dart';

import '../index.dart';

part 'sumrealized.g.dart';


@JsonSerializable()
class DatatableSumr {
  String? code;
  String? quantity;
  String? buyPriceAgv;
  String? buyIntoMoney;
  String? buyFee;
  String? buyTotal;
  String? sellPriceAgv;
  String? sellIntoMoney;
  String? sellFee;
  String? sellTotal;
  String? loanFee;
  String? advanceFee;
  String? profit;
  String? percent;

  DatatableSumr(
      {this.code,
        this.quantity,
        this.buyPriceAgv,
        this.buyIntoMoney,
        this.buyFee,
        this.buyTotal,
        this.sellPriceAgv,
        this.sellIntoMoney,
        this.sellFee,
        this.sellTotal,
        this.loanFee,
        this.advanceFee,
        this.profit,
        this.percent});

  factory DatatableSumr.fromJson(Map<String, dynamic> json) => _$DatatableSumrFromJson(json);
  Map<String, dynamic> toJson() => _$DatatableSumrToJson(this);
}

@JsonSerializable()
class TotalSumr {
  final String? name;
  final String? value;

  TotalSumr(this.name, this.value);

  factory TotalSumr.fromJson(Map<String, dynamic> json) => _$TotalSumrFromJson(json);
  Map<String, dynamic> toJson() => _$TotalSumrToJson(this);
}

@JsonSerializable()
class DataSumrealized {
  final List<TotalSumr>? total;
  final List<DatatableSumr>? datatable;

  DataSumrealized(this.total, this.datatable);

  factory DataSumrealized.fromJson(Map<String, dynamic> json) => _$DataSumrealizedFromJson(json);
  Map<String, dynamic> toJson() => _$DataSumrealizedToJson(this);
}


@JsonSerializable()
class SumrealizedResponse  extends BaseResponse{

  final DataSumrealized? data;

  SumrealizedResponse(this.data);

  factory SumrealizedResponse.fromJson(Map<String, dynamic> json) => _$SumrealizedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SumrealizedResponseToJson(this);
}
