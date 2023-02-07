
import 'package:json_annotation/json_annotation.dart';

import '../index.dart';

part 'home.g.dart';

@JsonSerializable()
class HomeList {
  String? mack;
  String? ton;
  String? giadongcua;
  String? tienban;
  String? tinhtrang;
  String? loinhuan;


  HomeList(this.mack,this.ton, this.giadongcua, this.tienban, this.tinhtrang, this.loinhuan);

  factory HomeList.fromJson(Map<String, dynamic> json) => _$HomeListFromJson(json);
  Map<String, dynamic> toJson() => _$HomeListToJson(this);
}

@JsonSerializable()
class HomeOrder {
  @JsonKey(name: "so_luong")
  final String? soLuong;
  final String? gia;
  @JsonKey(name: "sl_khop")
  final String? slKhop;
  @JsonKey(name: "gia_khop")
  final String? giaKhop;
  final String? mack;
  final String? giaodich;
  final String? giodat;
  final String? conlai;
  final String? giatrikhop;
  final String? tinhtrang;


  HomeOrder(this.soLuong, this.gia, this.slKhop, this.giaKhop, this.mack, this.giaodich, this.giodat, this.conlai, this.giatrikhop, this.tinhtrang);

  factory HomeOrder.fromJson(Map<String, dynamic> json) => _$HomeOrderFromJson(json);
  Map<String, dynamic> toJson() => _$HomeOrderToJson(this);
}

@JsonSerializable()
class HomeInfo {
  final String? name;
  final String? value;


  HomeInfo(this.name, this.value);

  factory HomeInfo.fromJson(Map<String, dynamic> json) => _$HomeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$HomeInfoToJson(this);
}

@JsonSerializable()
class HomeWiget {
  final String? name;
  final String? value;

  HomeWiget(this.name, this.value);

  factory HomeWiget.fromJson(Map<String, dynamic> json) => _$HomeWigetFromJson(json);
  Map<String, dynamic> toJson() => _$HomeWigetToJson(this);
}

@JsonSerializable()
class HomeData {
  final List<HomeWiget>? homeWiget;
  final List<HomeInfo>? homeInfo;
  final List<HomeOrder>? homeOrder;
  final List<HomeList>? homeList;

  HomeData(this.homeWiget, this.homeInfo, this.homeOrder, this.homeList);

  factory HomeData.fromJson(Map<String, dynamic> json) => _$HomeDataFromJson(json);
  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}


@JsonSerializable()
class HomeResponse  extends BaseResponse{

  HomeData? data;

  HomeResponse(this.data);

  factory HomeResponse.fromJson(Map<String, dynamic> json) => _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
