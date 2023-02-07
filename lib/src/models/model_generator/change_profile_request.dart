import 'package:json_annotation/json_annotation.dart';

part 'change_profile_request.g.dart';


@JsonSerializable()
class ChangeProfileRequest {
  final String email;
  final String phoneNumber;
  final String dateOfBirth;
  final String gender;
  final String address;

  ChangeProfileRequest({
    required this.email,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
  });

  factory ChangeProfileRequest.fromJson(Map<String, dynamic> json) => _$ChangeProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeProfileRequestToJson(this);
}
