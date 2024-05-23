part of 'transactions_cubit.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState.initial({
    @Default(false) bool isLoading,
    @Default(0) int year,
    @Default(0) int month,
    @Default([]) List<Transaction> transactions,
  }) = _Initial;
}
