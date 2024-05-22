// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankAccountResponseImpl _$$BankAccountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BankAccountResponseImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      balance: (json['balance'] as num).toDouble(),
    );

Map<String, dynamic> _$$BankAccountResponseImplToJson(
        _$BankAccountResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
    };
