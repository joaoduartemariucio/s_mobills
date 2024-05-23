part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial({
    @Default([]) List<SalesData> lastSevenDaysExpense,
    @Default([]) List<SalesData> lastSevenDaysIncome,
  }) = _Initial;
}
