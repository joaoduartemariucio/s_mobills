part of 'new_transaction_cubit.dart';

class TransactionDate {
  static final yesterdayDate = DateTime.now().subtract(const Duration(days: 1));
  static final todayDate = DateTime.now();
  static final initialDate = DateTime(2023);
  static final lastDate = DateTime(2025);
}

@freezed
class NewTransactionState with _$NewTransactionState {
  const factory NewTransactionState.initial({
    @Default(0.0) double transactionValue,
    @Default('') String description,
    @Default(false) bool done,
    @Default(true) bool showAllDateOptions,
    @Default(false) bool isLoading,
    @Default(TransactionType.income) TransactionType transactionType,
    @Default(CategoryType.food) CategoryType categoryType,
    @Default(-1) int bankAccountId,
    @Default('Selecione a conta') String bankAccountName,
    DateTime? selectedDate,
  }) = _Initial;
}
