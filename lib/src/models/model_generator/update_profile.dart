
import 'package:json_annotation/json_annotation.dart';

import '../../src_index.dart';

part 'update_profile.g.dart';



@JsonSerializable()
class UpdateProfile  extends BaseResponse{

  final String? avatar;

  UpdateProfile(this.avatar);

  factory UpdateProfile.fromJson(Map<String, dynamic> json) => _$UpdateProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileToJson(this);
}
