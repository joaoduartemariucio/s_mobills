// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_account_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdateAccountRequest {
  String get name => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateAccountRequestCopyWith<UpdateAccountRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateAccountRequestCopyWith<$Res> {
  factory $UpdateAccountRequestCopyWith(UpdateAccountRequest value,
          $Res Function(UpdateAccountRequest) then) =
      _$UpdateAccountRequestCopyWithImpl<$Res, UpdateAccountRequest>;
  @useResult
  $Res call({String name, double balance});
}

/// @nodoc
class _$UpdateAccountRequestCopyWithImpl<$Res,
        $Val extends UpdateAccountRequest>
    implements $UpdateAccountRequestCopyWith<$Res> {
  _$UpdateAccountRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$UpdateAccountRequestImplCopyWith<$Res>
    implements $UpdateAccountRequestCopyWith<$Res> {
  factory _$$UpdateAccountRequestImplCopyWith(_$UpdateAccountRequestImpl value,
          $Res Function(_$UpdateAccountRequestImpl) then) =
      __$$UpdateAccountRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double balance});
}

/// @nodoc
class __$$UpdateAccountRequestImplCopyWithImpl<$Res>
    extends _$UpdateAccountRequestCopyWithImpl<$Res, _$UpdateAccountRequestImpl>
    implements _$$UpdateAccountRequestImplCopyWith<$Res> {
  __$$UpdateAccountRequestImplCopyWithImpl(_$UpdateAccountRequestImpl _value,
      $Res Function(_$UpdateAccountRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? balance = null,
  }) {
    return _then(_$UpdateAccountRequestImpl(
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

class _$UpdateAccountRequestImpl extends _UpdateAccountRequest {
  _$UpdateAccountRequestImpl({required this.name, required this.balance})
      : super._();

  @override
  final String name;
  @override
  final double balance;

  @override
  String toString() {
    return 'UpdateAccountRequest(name: $name, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAccountRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAccountRequestImplCopyWith<_$UpdateAccountRequestImpl>
      get copyWith =>
          __$$UpdateAccountRequestImplCopyWithImpl<_$UpdateAccountRequestImpl>(
              this, _$identity);
}

abstract class _UpdateAccountRequest extends UpdateAccountRequest {
  factory _UpdateAccountRequest(
      {required final String name,
      required final double balance}) = _$UpdateAccountRequestImpl;
  _UpdateAccountRequest._() : super._();

  @override
  String get name;
  @override
  double get balance;
  @override
  @JsonKey(ignore: true)
  _$$UpdateAccountRequestImplCopyWith<_$UpdateAccountRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
