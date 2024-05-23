// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'period_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PeriodRequest {
  DateTime get initialDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeriodRequestCopyWith<PeriodRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeriodRequestCopyWith<$Res> {
  factory $PeriodRequestCopyWith(
          PeriodRequest value, $Res Function(PeriodRequest) then) =
      _$PeriodRequestCopyWithImpl<$Res, PeriodRequest>;
  @useResult
  $Res call({DateTime initialDate, DateTime endDate});
}

/// @nodoc
class _$PeriodRequestCopyWithImpl<$Res, $Val extends PeriodRequest>
    implements $PeriodRequestCopyWith<$Res> {
  _$PeriodRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      initialDate: null == initialDate
          ? _value.initialDate
          : initialDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PeriodRequestImplCopyWith<$Res>
    implements $PeriodRequestCopyWith<$Res> {
  factory _$$PeriodRequestImplCopyWith(
          _$PeriodRequestImpl value, $Res Function(_$PeriodRequestImpl) then) =
      __$$PeriodRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime initialDate, DateTime endDate});
}

/// @nodoc
class __$$PeriodRequestImplCopyWithImpl<$Res>
    extends _$PeriodRequestCopyWithImpl<$Res, _$PeriodRequestImpl>
    implements _$$PeriodRequestImplCopyWith<$Res> {
  __$$PeriodRequestImplCopyWithImpl(
      _$PeriodRequestImpl _value, $Res Function(_$PeriodRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialDate = null,
    Object? endDate = null,
  }) {
    return _then(_$PeriodRequestImpl(
      initialDate: null == initialDate
          ? _value.initialDate
          : initialDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$PeriodRequestImpl extends _PeriodRequest {
  _$PeriodRequestImpl({required this.initialDate, required this.endDate})
      : super._();

  @override
  final DateTime initialDate;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'PeriodRequest(initialDate: $initialDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeriodRequestImpl &&
            (identical(other.initialDate, initialDate) ||
                other.initialDate == initialDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, initialDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PeriodRequestImplCopyWith<_$PeriodRequestImpl> get copyWith =>
      __$$PeriodRequestImplCopyWithImpl<_$PeriodRequestImpl>(this, _$identity);
}

abstract class _PeriodRequest extends PeriodRequest {
  factory _PeriodRequest(
      {required final DateTime initialDate,
      required final DateTime endDate}) = _$PeriodRequestImpl;
  _PeriodRequest._() : super._();

  @override
  DateTime get initialDate;
  @override
  DateTime get endDate;
  @override
  @JsonKey(ignore: true)
  _$$PeriodRequestImplCopyWith<_$PeriodRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
