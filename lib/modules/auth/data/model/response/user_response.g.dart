// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseImpl _$$UserResponseImplFromJson(Map<String, dynamic> json) =>
    _$UserResponseImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      age: json['age'] as int,
      email: json['email'] as String,
      password: json['password'] as String,
      token: json['token'] as String?,
      account: json['account'] as String?,
    );

Map<String, dynamic> _$$UserResponseImplToJson(_$UserResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'email': instance.email,
      'password': instance.password,
      'token': instance.token,
      'account': instance.account,
    };
