part of 'home_cubit.dart';

const _currencyZero = Currency(value: 0);

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial({
    @Default([]) List<SalesData> lastSevenDaysExpense,
    @Default(false) bool lastSevenDaysExpenseEmpty,
    @Default([]) List<PieByCategory> categoriesDataSource,
    @Default(_currencyZero) Currency totalExpense,
    @Default(_currencyZero) Currency totalIncome,
    @Default(_currencyZero) Currency balance,
    @Default(_currencyZero) Currency balanceInAccounts,
    @Default(0.00) double economyPercent,
    @Default(false) bool spendingTooMuch,
    @Default(0) int year,
    @Default(0) int month,
    @Default(false) bool isLoading,
  }) = _Initial;
}
