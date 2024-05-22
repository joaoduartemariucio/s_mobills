// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionResponseImpl _$$TransactionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionResponseImpl(
      id: json['id'] as int,
      description: json['description'] as String,
      value: (json['value'] as num).toDouble(),
      accountId: json['accountId'] as int,
      date: DateTime.parse(json['date'] as String),
      done: json['done'] as bool,
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      category: $enumDecode(_$CategoryTypeEnumMap, json['category']),
    );

Map<String, dynamic> _$$TransactionResponseImplToJson(
        _$TransactionResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'value': instance.value,
      'accountId': instance.accountId,
      'date': instance.date.toIso8601String(),
      'done': instance.done,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'category': _$CategoryTypeEnumMap[instance.category]!,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
};

const _$CategoryTypeEnumMap = {
  CategoryType.food: 'food',
  CategoryType.beautyAndPersonalCare: 'beautyAndPersonalCare',
  CategoryType.fashionAndClothing: 'fashionAndClothing',
  CategoryType.healthAndFitness: 'healthAndFitness',
  CategoryType.technology: 'technology',
  CategoryType.homeAndDecoration: 'homeAndDecoration',
  CategoryType.entertainment: 'entertainment',
  CategoryType.education: 'education',
  CategoryType.travel: 'travel',
  CategoryType.finance: 'finance',
  CategoryType.automobiles: 'automobiles',
  CategoryType.sports: 'sports',
  CategoryType.pets: 'pets',
  CategoryType.artsAndCulture: 'artsAndCulture',
  CategoryType.workAndCareer: 'workAndCareer',
  CategoryType.investments: 'investments',
  CategoryType.wage: 'wage',
  CategoryType.gift: 'gift',
  CategoryType.award: 'award',
  CategoryType.restitution: 'restitution',
  CategoryType.others: 'others',
};
