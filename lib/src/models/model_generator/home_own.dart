
import 'package:json_annotation/json_annotation.dart';

import '../index.dart';

part 'home_own.g.dart';


@JsonSerializable()
class HomeOwnInfo {
  final String? name;
  final String? value;


  HomeOwnInfo(this.name, this.value);

  factory HomeOwnInfo.fromJson(Map<String, dynamic> json) => _$HomeOwnInfoFromJson(json);
  Map<String, dynamic> toJson() => _$HomeOwnInfoToJson(this);
}

@JsonSerializable()
class HomeOwnWiget {
  final String? name;
  final String? value;

  HomeOwnWiget(this.name, this.value,);

  factory HomeOwnWiget.fromJson(Map<String, dynamic> json) => _$HomeOwnWigetFromJson(json);
  Map<String, dynamic> toJson() => _$HomeOwnWigetToJson(this);
}

@JsonSerializable()
class HomeOwnList {
  final String? mack;
  final String? ton;
  final String? giadongcua;
  final String? tienban;
  final String? tinhtrang;

  HomeOwnList(this.mack, this.ton, this.giadongcua, this.tienban, this.tinhtrang);

  factory HomeOwnList.fromJson(Map<String, dynamic> json) => _$HomeOwnListFromJson(json);
  Map<String, dynamic> toJson() => _$HomeOwnListToJson(this);
}

@JsonSerializable()
class HomeOwnData {
  final List<HomeOwnWiget>? homeWiget;
  final List<HomeOwnInfo>? homeInfo;
  final List<HomeOwnList>? homeList;

  HomeOwnData(this.homeWiget, this.homeInfo, this.homeList);

  factory HomeOwnData.fromJson(Map<String, dynamic> json) => _$HomeOwnDataFromJson(json);
  Map<String, dynamic> toJson() => _$HomeOwnDataToJson(this);
}


@JsonSerializable()
class HomeOwnResponse extends BaseResponse{

  HomeOwnData? data;

  HomeOwnResponse(this.data);

  factory HomeOwnResponse.fromJson(Map<String, dynamic> json) => _$HomeOwnResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeOwnResponseToJson(this);
}
