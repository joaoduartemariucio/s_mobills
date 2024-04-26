// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewTransactionState {
  String get transactionValue => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;
  TransactionType get transactionType => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String transactionValue, String description,
            String category, bool done, TransactionType transactionType)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String transactionValue, String description,
            String category, bool done, TransactionType transactionType)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String transactionValue, String description,
            String category, bool done, TransactionType transactionType)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewTransactionStateCopyWith<NewTransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewTransactionStateCopyWith<$Res> {
  factory $NewTransactionStateCopyWith(
          NewTransactionState value, $Res Function(NewTransactionState) then) =
      _$NewTransactionStateCopyWithImpl<$Res, NewTransactionState>;
  @useResult
  $Res call(
      {String transactionValue,
      String description,
      String category,
      bool done,
      TransactionType transactionType});
}

/// @nodoc
class _$NewTransactionStateCopyWithImpl<$Res, $Val extends NewTransactionState>
    implements $NewTransactionStateCopyWith<$Res> {
  _$NewTransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionValue = null,
    Object? description = null,
    Object? category = null,
    Object? done = null,
    Object? transactionType = freezed,
  }) {
    return _then(_value.copyWith(
      transactionValue: null == transactionValue
          ? _value.transactionValue
          : transactionValue // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $NewTransactionStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String transactionValue,
      String description,
      String category,
      bool done,
      TransactionType transactionType});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NewTransactionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionValue = null,
    Object? description = null,
    Object? category = null,
    Object? done = null,
    Object? transactionType = freezed,
  }) {
    return _then(_$InitialImpl(
      transactionValue: null == transactionValue
          ? _value.transactionValue
          : transactionValue // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.transactionValue = r'R$ 0,00',
      this.description = '',
      this.category = '',
      this.done = false,
      this.transactionType = TransactionType.income});

  @override
  @JsonKey()
  final String transactionValue;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey()
  final bool done;
  @override
  @JsonKey()
  final TransactionType transactionType;

  @override
  String toString() {
    return 'NewTransactionState.initial(transactionValue: $transactionValue, description: $description, category: $category, done: $done, transactionType: $transactionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.transactionValue, transactionValue) ||
                other.transactionValue == transactionValue) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.done, done) || other.done == done) &&
            const DeepCollectionEquality()
                .equals(other.transactionType, transactionType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionValue, description,
      category, done, const DeepCollectionEquality().hash(transactionType));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String transactionValue, String description,
            String category, bool done, TransactionType transactionType)
        initial,
  }) {
    return initial(
        transactionValue, description, category, done, transactionType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String transactionValue, String description,
            String category, bool done, TransactionType transactionType)?
        initial,
  }) {
    return initial?.call(
        transactionValue, description, category, done, transactionType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String transactionValue, String description,
            String category, bool done, TransactionType transactionType)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          transactionValue, description, category, done, transactionType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NewTransactionState {
  const factory _Initial(
      {final String transactionValue,
      final String description,
      final String category,
      final bool done,
      final TransactionType transactionType}) = _$InitialImpl;

  @override
  String get transactionValue;
  @override
  String get description;
  @override
  String get category;
  @override
  bool get done;
  @override
  TransactionType get transactionType;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
