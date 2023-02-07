
import 'package:json_annotation/json_annotation.dart';
import '../index.dart';

part 'trans_own.g.dart';


@JsonSerializable()
class DataTableTransOwn {
  final String? date;
  final String? code;
  final String? buyQuantity;
  final String? buyPrice;
  final String? buyTotal;
  final String? sellQuantity;
  final String? sellPrice;
  final String? sellTotal;
  final String? status;


  DataTableTransOwn(this.date, this.code, this.buyQuantity, this.buyPrice, this.buyTotal, this.sellQuantity, this.sellPrice, this.sellTotal, this.status);

  factory DataTableTransOwn.fromJson(Map<String, dynamic> json) => _$DataTableTransOwnFromJson(json);
  Map<String, dynamic> toJson() => _$DataTableTransOwnToJson(this);
}

@JsonSerializable()
class TotalTransOwn {
  final String? name;
  final String? value;

  TotalTransOwn(this.name, this.value);

  factory TotalTransOwn.fromJson(Map<String, dynamic> json) => _$TotalTransOwnFromJson(json);
  Map<String, dynamic> toJson() => _$TotalTransOwnToJson(this);
}

@JsonSerializable()
class DataTransOwn {
  final List<TotalTransOwn>? total;
  final List<DataTableTransOwn>? dataTable;
  final String? maxPage;

  DataTransOwn(this.total, this.dataTable,this.maxPage);

  factory DataTransOwn.fromJson(Map<String, dynamic> json) => _$DataTransOwnFromJson(json);
  Map<String, dynamic> toJson() => _$DataTransOwnToJson(this);
}


@JsonSerializable()
class TransOwnResponse  extends BaseResponse{

  final DataTransOwn? data;

  TransOwnResponse(this.data);

  factory TransOwnResponse.fromJson(Map<String, dynamic> json) => _$TransOwnResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransOwnResponseToJson(this);
}
