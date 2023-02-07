
import 'package:json_annotation/json_annotation.dart';
import '../index.dart';

part 'money_own.g.dart';


@JsonSerializable()
class DataTableMoneyOwn {
  final String? id;
  final String? date;
  final String? description;
  final String? cashIn;
  final String? cashOut;



  DataTableMoneyOwn(this.id, this.date, this.description, this.cashIn, this.cashOut);

  factory DataTableMoneyOwn.fromJson(Map<String, dynamic> json) => _$DataTableMoneyOwnFromJson(json);
  Map<String, dynamic> toJson() => _$DataTableMoneyOwnToJson(this);
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
class DataMoneyOwn {
  final List<Total>? total;
  final List<DataTableMoneyOwn>? datatable;
  final String? maxPage;

  DataMoneyOwn(this.total, this.datatable,this.maxPage);

  factory DataMoneyOwn.fromJson(Map<String, dynamic> json) => _$DataMoneyOwnFromJson(json);
  Map<String, dynamic> toJson() => _$DataMoneyOwnToJson(this);
}


@JsonSerializable()
class MoneyOwnResponse  extends BaseResponse{

  final DataMoneyOwn? data;

  MoneyOwnResponse(this.data);

  factory MoneyOwnResponse.fromJson(Map<String, dynamic> json) => _$MoneyOwnResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoneyOwnResponseToJson(this);
}
