
import 'package:json_annotation/json_annotation.dart';

import '../index.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  String? id;
  String? name;
  String? email;
  String? dob;
  String? address;
  String? phoneNumber;
  String? sex;
  String? avatar;

  Profile(
      {this.id,
        this.name,
        this.email,
        this.dob,
        this.address,
        this.phoneNumber,
        this.sex,
        this.avatar});

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable()
class DataProfile {
  List<Profile>? profile;
  String? type;

  DataProfile({this.profile, this.type});

  factory DataProfile.fromJson(Map<String, dynamic> json) => _$DataProfileFromJson(json);
  Map<String, dynamic> toJson() => _$DataProfileToJson(this);
}


@JsonSerializable()
class ProfileResponse  extends BaseResponse{

  final DataProfile? data;

  ProfileResponse(this.data);

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
