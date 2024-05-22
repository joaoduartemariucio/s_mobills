// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_account_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditAccountState {
  bool get isSaveLoading => throw _privateConstructorUsedError;
  bool get isDeleteLoading => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isSaveLoading, bool isDeleteLoading, int id,
            String name, double balance)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isSaveLoading, bool isDeleteLoading, int id,
            String name, double balance)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isSaveLoading, bool isDeleteLoading, int id,
            String name, double balance)?
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
  $EditAccountStateCopyWith<EditAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditAccountStateCopyWith<$Res> {
  factory $EditAccountStateCopyWith(
          EditAccountState value, $Res Function(EditAccountState) then) =
      _$EditAccountStateCopyWithImpl<$Res, EditAccountState>;
  @useResult
  $Res call(
      {bool isSaveLoading,
      bool isDeleteLoading,
      int id,
      String name,
      double balance});
}

/// @nodoc
class _$EditAccountStateCopyWithImpl<$Res, $Val extends EditAccountState>
    implements $EditAccountStateCopyWith<$Res> {
  _$EditAccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSaveLoading = null,
    Object? isDeleteLoading = null,
    Object? id = null,
    Object? name = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      isSaveLoading: null == isSaveLoading
          ? _value.isSaveLoading
          : isSaveLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleteLoading: null == isDeleteLoading
          ? _value.isDeleteLoading
          : isDeleteLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$InitialImplCopyWith<$Res>
    implements $EditAccountStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSaveLoading,
      bool isDeleteLoading,
      int id,
      String name,
      double balance});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$EditAccountStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSaveLoading = null,
    Object? isDeleteLoading = null,
    Object? id = null,
    Object? name = null,
    Object? balance = null,
  }) {
    return _then(_$InitialImpl(
      isSaveLoading: null == isSaveLoading
          ? _value.isSaveLoading
          : isSaveLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleteLoading: null == isDeleteLoading
          ? _value.isDeleteLoading
          : isDeleteLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isSaveLoading = false,
      this.isDeleteLoading = false,
      this.id = -1,
      this.name = '',
      this.balance = 0});

  @override
  @JsonKey()
  final bool isSaveLoading;
  @override
  @JsonKey()
  final bool isDeleteLoading;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final double balance;

  @override
  String toString() {
    return 'EditAccountState.initial(isSaveLoading: $isSaveLoading, isDeleteLoading: $isDeleteLoading, id: $id, name: $name, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isSaveLoading, isSaveLoading) ||
                other.isSaveLoading == isSaveLoading) &&
            (identical(other.isDeleteLoading, isDeleteLoading) ||
                other.isDeleteLoading == isDeleteLoading) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isSaveLoading, isDeleteLoading, id, name, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isSaveLoading, bool isDeleteLoading, int id,
            String name, double balance)
        initial,
  }) {
    return initial(isSaveLoading, isDeleteLoading, id, name, balance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isSaveLoading, bool isDeleteLoading, int id,
            String name, double balance)?
        initial,
  }) {
    return initial?.call(isSaveLoading, isDeleteLoading, id, name, balance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isSaveLoading, bool isDeleteLoading, int id,
            String name, double balance)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isSaveLoading, isDeleteLoading, id, name, balance);
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

abstract class _Initial implements EditAccountState {
  const factory _Initial(
      {final bool isSaveLoading,
      final bool isDeleteLoading,
      final int id,
      final String name,
      final double balance}) = _$InitialImpl;

  @override
  bool get isSaveLoading;
  @override
  bool get isDeleteLoading;
  @override
  int get id;
  @override
  String get name;
  @override
  double get balance;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
