import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info_user.g.dart';

@JsonSerializable()
class InfoUser extends Equatable {
  String? id;
  String? nhom;
  String? objId;
  String? fullname;
  String? token;
  String? email;
  String? dob;
  String? address;
  String? phoneNumber;
  String? sex;
  String? avatar;

  static const empty = null;

  InfoUser({
      this.id,
      this.nhom,
      this.objId,
      this.fullname,
      this.token,
      this.email,
      this.dob,
      this.address,
      this.phoneNumber,
      this.sex,
      this.avatar
  });

  InfoUser copyWith({
        String? id,
        String? nhom,
        String? objId,
        String? fullname,
        String? token,
        String? email,
        String? dob,
        String? address,
        String? phoneNumber,
        String? sex,
        String? avatar,
      }) {
    return InfoUser(
      id: id ?? this.id,
      nhom: nhom ?? this.nhom,
      objId: objId ?? this.objId,
      fullname: fullname ?? this.fullname,
      token: token ?? this.token,
      email: email ?? this.email,
      dob: dob ?? this.dob,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      sex: sex ?? this.sex,
      avatar: avatar ?? this.avatar,
    );
  }

  factory InfoUser.fromJson(Map<String, dynamic> json) =>
      _$InfoUserFromJson(json);

  Map<String, dynamic> toJson() => _$InfoUserToJson(this);

  @override
  List<Object> get props => [id!, nhom!, objId!, fullname!, token!, email!, dob!, address!, phoneNumber!, sex!, avatar!];
}