import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? profileUrl;
  String? phoneNumber;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.profileUrl,
    this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
