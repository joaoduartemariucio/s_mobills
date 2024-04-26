part of 'new_transaction_cubit.dart';

@freezed
class NewTransactionState with _$NewTransactionState {
  const factory NewTransactionState.initial({
    @Default(r'R$ 0,00') String transactionValue,
    @Default('') String description,
    @Default('') String category,
    @Default(false) bool done,
    @Default(TransactionType.income) TransactionType transactionType,
  }) = _Initial;
}
