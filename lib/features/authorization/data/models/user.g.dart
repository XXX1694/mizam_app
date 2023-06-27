// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['full_name'] as String,
      json['email'] as String,
      json['password'] as String,
      json['phone_number'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'full_name': instance.full_name,
      'email': instance.email,
      'password': instance.password,
      'phone_number': instance.phone_number,
    };
