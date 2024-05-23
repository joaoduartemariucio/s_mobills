// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionState {
  double get transactionValue => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;
  bool get showAllDateOptions => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  TransactionType get transactionType => throw _privateConstructorUsedError;
  CategoryType get categoryType => throw _privateConstructorUsedError;
  int get bankAccountId => throw _privateConstructorUsedError;
  String get bankAccountName => throw _privateConstructorUsedError;
  int get transactionId => throw _privateConstructorUsedError;
  DateTime? get selectedDate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double transactionValue,
            String description,
            bool done,
            bool showAllDateOptions,
            bool isLoading,
            TransactionType transactionType,
            CategoryType categoryType,
            int bankAccountId,
            String bankAccountName,
            int transactionId,
            DateTime? selectedDate)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double transactionValue,
            String description,
            bool done,
            bool showAllDateOptions,
            bool isLoading,
            TransactionType transactionType,
            CategoryType categoryType,
            int bankAccountId,
            String bankAccountName,
            int transactionId,
            DateTime? selectedDate)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double transactionValue,
            String description,
            bool done,
            bool showAllDateOptions,
            bool isLoading,
            TransactionType transactionType,
            CategoryType categoryType,
            int bankAccountId,
            String bankAccountName,
            int transactionId,
            DateTime? selectedDate)?
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
  $TransactionStateCopyWith<TransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionStateCopyWith<$Res> {
  factory $TransactionStateCopyWith(
          TransactionState value, $Res Function(TransactionState) then) =
      _$TransactionStateCopyWithImpl<$Res, TransactionState>;
  @useResult
  $Res call(
      {double transactionValue,
      String description,
      bool done,
      bool showAllDateOptions,
      bool isLoading,
      TransactionType transactionType,
      CategoryType categoryType,
      int bankAccountId,
      String bankAccountName,
      int transactionId,
      DateTime? selectedDate});
}

/// @nodoc
class _$TransactionStateCopyWithImpl<$Res, $Val extends TransactionState>
    implements $TransactionStateCopyWith<$Res> {
  _$TransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionValue = null,
    Object? description = null,
    Object? done = null,
    Object? showAllDateOptions = null,
    Object? isLoading = null,
    Object? transactionType = null,
    Object? categoryType = null,
    Object? bankAccountId = null,
    Object? bankAccountName = null,
    Object? transactionId = null,
    Object? selectedDate = freezed,
  }) {
    return _then(_value.copyWith(
      transactionValue: null == transactionValue
          ? _value.transactionValue
          : transactionValue // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      showAllDateOptions: null == showAllDateOptions
          ? _value.showAllDateOptions
          : showAllDateOptions // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as CategoryType,
      bankAccountId: null == bankAccountId
          ? _value.bankAccountId
          : bankAccountId // ignore: cast_nullable_to_non_nullable
              as int,
      bankAccountName: null == bankAccountName
          ? _value.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $TransactionStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double transactionValue,
      String description,
      bool done,
      bool showAllDateOptions,
      bool isLoading,
      TransactionType transactionType,
      CategoryType categoryType,
      int bankAccountId,
      String bankAccountName,
      int transactionId,
      DateTime? selectedDate});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionValue = null,
    Object? description = null,
    Object? done = null,
    Object? showAllDateOptions = null,
    Object? isLoading = null,
    Object? transactionType = null,
    Object? categoryType = null,
    Object? bankAccountId = null,
    Object? bankAccountName = null,
    Object? transactionId = null,
    Object? selectedDate = freezed,
  }) {
    return _then(_$InitialImpl(
      transactionValue: null == transactionValue
          ? _value.transactionValue
          : transactionValue // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      showAllDateOptions: null == showAllDateOptions
          ? _value.showAllDateOptions
          : showAllDateOptions // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as CategoryType,
      bankAccountId: null == bankAccountId
          ? _value.bankAccountId
          : bankAccountId // ignore: cast_nullable_to_non_nullable
              as int,
      bankAccountName: null == bankAccountName
          ? _value.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.transactionValue = 0.0,
      this.description = '',
      this.done = false,
      this.showAllDateOptions = true,
      this.isLoading = false,
      this.transactionType = TransactionType.income,
      this.categoryType = CategoryType.food,
      this.bankAccountId = -1,
      this.bankAccountName = 'Selecione a conta',
      this.transactionId = -1,
      this.selectedDate});

  @override
  @JsonKey()
  final double transactionValue;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final bool done;
  @override
  @JsonKey()
  final bool showAllDateOptions;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final TransactionType transactionType;
  @override
  @JsonKey()
  final CategoryType categoryType;
  @override
  @JsonKey()
  final int bankAccountId;
  @override
  @JsonKey()
  final String bankAccountName;
  @override
  @JsonKey()
  final int transactionId;
  @override
  final DateTime? selectedDate;

  @override
  String toString() {
    return 'TransactionState.initial(transactionValue: $transactionValue, description: $description, done: $done, showAllDateOptions: $showAllDateOptions, isLoading: $isLoading, transactionType: $transactionType, categoryType: $categoryType, bankAccountId: $bankAccountId, bankAccountName: $bankAccountName, transactionId: $transactionId, selectedDate: $selectedDate)';
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
            (identical(other.done, done) || other.done == done) &&
            (identical(other.showAllDateOptions, showAllDateOptions) ||
                other.showAllDateOptions == showAllDateOptions) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.bankAccountId, bankAccountId) ||
                other.bankAccountId == bankAccountId) &&
            (identical(other.bankAccountName, bankAccountName) ||
                other.bankAccountName == bankAccountName) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionValue,
      description,
      done,
      showAllDateOptions,
      isLoading,
      transactionType,
      categoryType,
      bankAccountId,
      bankAccountName,
      transactionId,
      selectedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            double transactionValue,
            String description,
            bool done,
            bool showAllDateOptions,
            bool isLoading,
            TransactionType transactionType,
            CategoryType categoryType,
            int bankAccountId,
            String bankAccountName,
            int transactionId,
            DateTime? selectedDate)
        initial,
  }) {
    return initial(
        transactionValue,
        description,
        done,
        showAllDateOptions,
        isLoading,
        transactionType,
        categoryType,
        bankAccountId,
        bankAccountName,
        transactionId,
        selectedDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            double transactionValue,
            String description,
            bool done,
            bool showAllDateOptions,
            bool isLoading,
            TransactionType transactionType,
            CategoryType categoryType,
            int bankAccountId,
            String bankAccountName,
            int transactionId,
            DateTime? selectedDate)?
        initial,
  }) {
    return initial?.call(
        transactionValue,
        description,
        done,
        showAllDateOptions,
        isLoading,
        transactionType,
        categoryType,
        bankAccountId,
        bankAccountName,
        transactionId,
        selectedDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            double transactionValue,
            String description,
            bool done,
            bool showAllDateOptions,
            bool isLoading,
            TransactionType transactionType,
            CategoryType categoryType,
            int bankAccountId,
            String bankAccountName,
            int transactionId,
            DateTime? selectedDate)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          transactionValue,
          description,
          done,
          showAllDateOptions,
          isLoading,
          transactionType,
          categoryType,
          bankAccountId,
          bankAccountName,
          transactionId,
          selectedDate);
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

abstract class _Initial implements TransactionState {
  const factory _Initial(
      {final double transactionValue,
      final String description,
      final bool done,
      final bool showAllDateOptions,
      final bool isLoading,
      final TransactionType transactionType,
      final CategoryType categoryType,
      final int bankAccountId,
      final String bankAccountName,
      final int transactionId,
      final DateTime? selectedDate}) = _$InitialImpl;

  @override
  double get transactionValue;
  @override
  String get description;
  @override
  bool get done;
  @override
  bool get showAllDateOptions;
  @override
  bool get isLoading;
  @override
  TransactionType get transactionType;
  @override
  CategoryType get categoryType;
  @override
  int get bankAccountId;
  @override
  String get bankAccountName;
  @override
  int get transactionId;
  @override
  DateTime? get selectedDate;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
