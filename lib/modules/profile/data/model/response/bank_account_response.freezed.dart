// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_account_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BankAccountResponse _$BankAccountResponseFromJson(Map<String, dynamic> json) {
  return _BankAccountResponse.fromJson(json);
}

/// @nodoc
mixin _$BankAccountResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankAccountResponseCopyWith<BankAccountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountResponseCopyWith<$Res> {
  factory $BankAccountResponseCopyWith(
          BankAccountResponse value, $Res Function(BankAccountResponse) then) =
      _$BankAccountResponseCopyWithImpl<$Res, BankAccountResponse>;
  @useResult
  $Res call({int id, String name, double balance});
}

/// @nodoc
class _$BankAccountResponseCopyWithImpl<$Res, $Val extends BankAccountResponse>
    implements $BankAccountResponseCopyWith<$Res> {
  _$BankAccountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankAccountResponseImplCopyWith<$Res>
    implements $BankAccountResponseCopyWith<$Res> {
  factory _$$BankAccountResponseImplCopyWith(_$BankAccountResponseImpl value,
          $Res Function(_$BankAccountResponseImpl) then) =
      __$$BankAccountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, double balance});
}

/// @nodoc
class __$$BankAccountResponseImplCopyWithImpl<$Res>
    extends _$BankAccountResponseCopyWithImpl<$Res, _$BankAccountResponseImpl>
    implements _$$BankAccountResponseImplCopyWith<$Res> {
  __$$BankAccountResponseImplCopyWithImpl(_$BankAccountResponseImpl _value,
      $Res Function(_$BankAccountResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? balance = null,
  }) {
    return _then(_$BankAccountResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankAccountResponseImpl extends _BankAccountResponse {
  _$BankAccountResponseImpl(
      {required this.id, required this.name, required this.balance})
      : super._();

  factory _$BankAccountResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankAccountResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double balance;

  @override
  String toString() {
    return 'BankAccountResponse(id: $id, name: $name, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankAccountResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankAccountResponseImplCopyWith<_$BankAccountResponseImpl> get copyWith =>
      __$$BankAccountResponseImplCopyWithImpl<_$BankAccountResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankAccountResponseImplToJson(
      this,
    );
  }
}

abstract class _BankAccountResponse extends BankAccountResponse {
  factory _BankAccountResponse(
      {required final int id,
      required final String name,
      required final double balance}) = _$BankAccountResponseImpl;
  _BankAccountResponse._() : super._();

  factory _BankAccountResponse.fromJson(Map<String, dynamic> json) =
      _$BankAccountResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get balance;
  @override
  @JsonKey(ignore: true)
  _$$BankAccountResponseImplCopyWith<_$BankAccountResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
