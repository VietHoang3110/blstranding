// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noti.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Noti _$NotiFromJson(Map<String, dynamic> json) => Noti(
      json['id'] as String?,
      json['name'] as String?,
      json['content'] as String?,
      json['date'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$NotiToJson(Noti instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'content': instance.content,
      'date': instance.date,
      'status': instance.status,
    };

DataNoti _$DataNotiFromJson(Map<String, dynamic> json) => DataNoti(
      (json['dataTable'] as List<dynamic>?)
          ?.map((e) => Noti.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['page'] as String?,
      json['maxPage'] as String?,
      json['numOfRecords'] as String?,
      json['unreadCount'] as int?,
    );

Map<String, dynamic> _$DataNotiToJson(DataNoti instance) => <String, dynamic>{
      'dataTable': instance.dataTable,
      'page': instance.page,
      'maxPage': instance.maxPage,
      'numOfRecords': instance.numOfRecords,
      'unreadCount': instance.unreadCount,
    };

NotiResponse _$NotiResponseFromJson(Map<String, dynamic> json) => NotiResponse(
      json['data'] == null
          ? null
          : DataNoti.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..code = json['code'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$NotiResponseToJson(NotiResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
