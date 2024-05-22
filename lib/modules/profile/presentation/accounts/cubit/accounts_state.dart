part of 'accounts_cubit.dart';

@freezed
class AccountsState with _$AccountsState {
  const factory AccountsState.initial({
    @Default(false) bool isLoading,
    @Default(false) bool isNewTransaction,
    @Default(false) bool isEmptyAccounts,
    @Default([]) List<BankAccount> accounts,
  }) = _Initial;
}
