
import 'package:json_annotation/json_annotation.dart';
import 'package:quan_ly/src/models/model_generator/trans.dart';

import '../index.dart';

part 'trans.g.dart';


@JsonSerializable()
class TransHistory {
  String? date;
  String? code;
  String? sellAmount;
  String? buyAmount;
  String? sellPrice;
  String? intoMoney;
  String? provisional;
  String? moneyBuy;
  String? status;

  TransHistory(
      {this.date,
        this.code,
        this.sellAmount,
        this.buyAmount,
        this.sellPrice,
        this.intoMoney,
        this.provisional,
        this.moneyBuy,
        this.status});


  factory TransHistory.fromJson(Map<String, dynamic> json) => _$TransHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$TransHistoryToJson(this);
}

@JsonSerializable()
class Total {
  final String? name;
  final String? value;

  Total(this.name, this.value);

  factory Total.fromJson(Map<String, dynamic> json) => _$TotalFromJson(json);
  Map<String, dynamic> toJson() => _$TotalToJson(this);
}

@JsonSerializable()
class DataTrans {
  final List<Total>? total;
  final List<TransHistory>? rows;
  final String? maxPage;

  DataTrans(this.total, this.rows, this.maxPage);

  factory DataTrans.fromJson(Map<String, dynamic> json) => _$DataTransFromJson(json);
  Map<String, dynamic> toJson() => _$DataTransToJson(this);
}


@JsonSerializable()
class TransResponse  extends BaseResponse{

  final DataTrans? data;

  TransResponse(this.data);

  factory TransResponse.fromJson(Map<String, dynamic> json) => _$TransResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransResponseToJson(this);
}
