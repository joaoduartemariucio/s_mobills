part of 'transactions_cubit.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState.initial({
    @Default([]) List<Transaction> transactions,
  }) = _Initial;
}
