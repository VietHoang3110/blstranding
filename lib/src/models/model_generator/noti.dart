
import 'package:json_annotation/json_annotation.dart';

import '../index.dart';

part 'noti.g.dart';

@JsonSerializable()
class Noti {
  final String? id;
  final String? name;
  final String? content;
  final String? date;
  final String? status;

  Noti(this.id, this.name, this.content, this.date, this.status);

  factory Noti.fromJson(Map<String, dynamic> json) => _$NotiFromJson(json);
  Map<String, dynamic> toJson() => _$NotiToJson(this);
}

@JsonSerializable()
class DataNoti {
  final List<Noti>? dataTable;
  final String? page;
  final String? maxPage;
  final String? numOfRecords;
  final int? unreadCount;

  DataNoti(this.dataTable, this.page, this.maxPage, this.numOfRecords, this.unreadCount);

  factory DataNoti.fromJson(Map<String, dynamic> json) => _$DataNotiFromJson(json);
  Map<String, dynamic> toJson() => _$DataNotiToJson(this);
}


@JsonSerializable()
class NotiResponse  extends BaseResponse{

  final DataNoti? data;

  NotiResponse(this.data);

  factory NotiResponse.fromJson(Map<String, dynamic> json) => _$NotiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotiResponseToJson(this);
}
