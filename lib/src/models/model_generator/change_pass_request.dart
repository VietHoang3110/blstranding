import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:quan_ly/api_resfull/api.dart';

part 'change_pass_request.g.dart';


@JsonSerializable()
class ChangePassRequest {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;


  ChangePassRequest(this.oldPassword, this.newPassword, this.confirmPassword);

  factory ChangePassRequest.fromJson(Map<String, dynamic> json) => _$ChangePassRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePassRequestToJson(this);
}
