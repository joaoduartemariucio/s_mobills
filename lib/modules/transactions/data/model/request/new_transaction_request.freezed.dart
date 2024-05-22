// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_transaction_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewTransactionRequest {
  double get value => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewTransactionRequestCopyWith<NewTransactionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewTransactionRequestCopyWith<$Res> {
  factory $NewTransactionRequestCopyWith(NewTransactionRequest value,
          $Res Function(NewTransactionRequest) then) =
      _$NewTransactionRequestCopyWithImpl<$Res, NewTransactionRequest>;
  @useResult
  $Res call(
      {double value,
      String description,
      DateTime date,
      bool done,
      String type,
      String category});
}

/// @nodoc
class _$NewTransactionRequestCopyWithImpl<$Res,
        $Val extends NewTransactionRequest>
    implements $NewTransactionRequestCopyWith<$Res> {
  _$NewTransactionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? description = null,
    Object? date = null,
    Object? done = null,
    Object? type = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewTransactionRequestImplCopyWith<$Res>
    implements $NewTransactionRequestCopyWith<$Res> {
  factory _$$NewTransactionRequestImplCopyWith(
          _$NewTransactionRequestImpl value,
          $Res Function(_$NewTransactionRequestImpl) then) =
      __$$NewTransactionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double value,
      String description,
      DateTime date,
      bool done,
      String type,
      String category});
}

/// @nodoc
class __$$NewTransactionRequestImplCopyWithImpl<$Res>
    extends _$NewTransactionRequestCopyWithImpl<$Res,
        _$NewTransactionRequestImpl>
    implements _$$NewTransactionRequestImplCopyWith<$Res> {
  __$$NewTransactionRequestImplCopyWithImpl(_$NewTransactionRequestImpl _value,
      $Res Function(_$NewTransactionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? description = null,
    Object? date = null,
    Object? done = null,
    Object? type = null,
    Object? category = null,
  }) {
    return _then(_$NewTransactionRequestImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NewTransactionRequestImpl extends _NewTransactionRequest {
  _$NewTransactionRequestImpl(
      {required this.value,
      required this.description,
      required this.date,
      required this.done,
      required this.type,
      required this.category})
      : super._();

  @override
  final double value;
  @override
  final String description;
  @override
  final DateTime date;
  @override
  final bool done;
  @override
  final String type;
  @override
  final String category;

  @override
  String toString() {
    return 'NewTransactionRequest(value: $value, description: $description, date: $date, done: $done, type: $type, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewTransactionRequestImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, value, description, date, done, type, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewTransactionRequestImplCopyWith<_$NewTransactionRequestImpl>
      get copyWith => __$$NewTransactionRequestImplCopyWithImpl<
          _$NewTransactionRequestImpl>(this, _$identity);
}

abstract class _NewTransactionRequest extends NewTransactionRequest {
  factory _NewTransactionRequest(
      {required final double value,
      required final String description,
      required final DateTime date,
      required final bool done,
      required final String type,
      required final String category}) = _$NewTransactionRequestImpl;
  _NewTransactionRequest._() : super._();

  @override
  double get value;
  @override
  String get description;
  @override
  DateTime get date;
  @override
  bool get done;
  @override
  String get type;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$NewTransactionRequestImplCopyWith<_$NewTransactionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
