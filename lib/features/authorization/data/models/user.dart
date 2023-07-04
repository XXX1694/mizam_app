// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  final List<String>? address;
  final String? full_name;
  final String? email;
  final String? password;
  final String? phone_number;
  UserModel(
    this.full_name,
    this.email,
    this.password,
    this.phone_number,
    this.address,
  );
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
