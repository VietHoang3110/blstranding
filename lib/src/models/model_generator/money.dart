
import 'package:json_annotation/json_annotation.dart';
import 'package:quan_ly/src/models/model_generator/trans.dart';

import '../index.dart';

part 'money.g.dart';



@JsonSerializable()
class RowsMoney {
  String? id;
  String? date;
  String? description;
  String? cashIn;
  String? cashOut;
  String? typeTransction;
  int? number;

  RowsMoney(
      {this.id,
        this.date,
        this.description,
        this.cashIn,
        this.cashOut,
        this.typeTransction,
        this.number});

  factory RowsMoney.fromJson(Map<String, dynamic> json) => _$RowsMoneyFromJson(json);
  Map<String, dynamic> toJson() => _$RowsMoneyToJson(this);
}

@JsonSerializable()
class TotalMoney {
  String? name;
  String? value;

  TotalMoney({this.name, this.value});
  factory TotalMoney.fromJson(Map<String, dynamic> json) => _$TotalMoneyFromJson(json);
  Map<String, dynamic> toJson() => _$TotalMoneyToJson(this);
}

@JsonSerializable()
class DataMoney {
  List<TotalMoney>? total;
  List<RowsMoney>? rows;
  final String? maxPage;

  DataMoney({this.total, this.rows,this.maxPage});

  factory DataMoney.fromJson(Map<String, dynamic> json) => _$DataMoneyFromJson(json);
  Map<String, dynamic> toJson() => _$DataMoneyToJson(this);
}


@JsonSerializable()
class MoneyResponse  extends BaseResponse{

  final DataMoney? data;

  MoneyResponse(this.data);

  factory MoneyResponse.fromJson(Map<String, dynamic> json) => _$MoneyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoneyResponseToJson(this);
}
