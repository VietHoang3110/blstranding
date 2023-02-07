
import 'package:json_annotation/json_annotation.dart';

import '../index.dart';

part 'login.g.dart';


@JsonSerializable()
class Login {
  final String? id;
  final String? nhom;
  final String? objId;
  final String? fullname;
  final String? token;
  final String? avatar;
  final String? email;
  final String? phoneNumber;
  final String? dob;
  final String? sex;
  final String? address;

  Login(this.id, this.nhom, this.objId, this.fullname, this.token, this.avatar, this.email, this.phoneNumber, this.dob, this.sex, this.address);

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}


@JsonSerializable()
class LoginResponse  extends BaseResponse{

  Login? data;

  LoginResponse(this.data);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
