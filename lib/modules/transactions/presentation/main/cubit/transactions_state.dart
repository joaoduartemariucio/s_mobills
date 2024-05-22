part of 'transactions_cubit.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState.initial({
    @Default(false) bool isLoading,
    @Default([]) List<Transaction> transactions,
  }) = _Initial;
}
