import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/modules.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  double sales;
}

class PieByCategory {
  PieByCategory(this.categoryType, this.value);

  final CategoryType categoryType;
  final double value;
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getTransactionsPeriodUseCase,
    required this.getUserBankAccountsUseCase,
  }) : super(const HomeState.initial()) {
    loadInfos();
  }

  final GetTransactionsPeriodUseCase getTransactionsPeriodUseCase;
  final GetUserBankAccountsUseCase getUserBankAccountsUseCase;

  Future<void> loadInfos() async {
    final date = DateTime.now();
    emit(state.copyWith(month: date.month, year: date.year));

    await _loadLastSevenDays();
    await _loadTransactionsMonth();
    await _loadAllAccounts();
  }

  Future<void> _loadLastSevenDays() async {
    try {
      emit(state.copyWith(isLoading: true));
      final inputFormatter = DateFormat('dd/MM');
      final List<SalesData> days = [];

      for (int i = 0; i < 7; i++) {
        final date = DateTime.now().subtract(Duration(days: i));
        days.add(SalesData(inputFormatter.format(date), 0));
      }

      final start = DateTime.now().subtract(const Duration(days: 7));
      final end = DateTime.now();

      final result = await getTransactionsPeriodUseCase(
        start: start,
        end: end,
      );

      final lastSevenDaysExpense = result
          .where(
            (element) => element.type == TransactionType.expense,
          )
          .map(
            (e) => SalesData(inputFormatter.format(e.date), e.value.value),
          );

      for (final e in lastSevenDaysExpense) {
        days.firstWhere((element) => e.year == element.year).sales += e.sales;
      }

      final lastSevenDaysExpenseEmpty = days.every((e) => e.sales == 0.00);

      emit(
        state.copyWith(
          lastSevenDaysExpense: days.reversed.toList(),
          lastSevenDaysExpenseEmpty: lastSevenDaysExpenseEmpty,
        ),
      );
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _loadTransactionsMonth() async {
    try {
      emit(state.copyWith(isLoading: true));

      final start = DateHelper.firstDayMonth(state.year, state.month);
      final end = DateHelper.lastDayMonth(state.year, state.month);

      final result = await getTransactionsPeriodUseCase(
        start: start,
        end: end,
      );

      final expenses =
          result.where((e) => e.type == TransactionType.expense).toList();
      final incomes =
          result.where((e) => e.type == TransactionType.income).toList();

      final groupByCategory = groupBy(expenses, (e) => e.category);

      final categoriesDataSource = <PieByCategory>[];

      groupByCategory.forEach((category, transactions) {
        final double total = transactions.fold(
          0,
          (prev, transaction) => prev + transaction.value.value,
        );

        categoriesDataSource.add(PieByCategory(category, total));
      });

      double totalExpense = 0;
      expenses.forEach((e) {
        totalExpense += e.value.value;
      });

      double totalIncome = 0;
      incomes.forEach((e) {
        totalIncome += e.value.value;
      });

      double balance = totalIncome - totalExpense;
      double economyPercent = (balance / totalIncome) * 100;
      bool spendingTooMuch = economyPercent < 20.00;

      emit(
        state.copyWith(
          categoriesDataSource: categoriesDataSource,
          balance: Currency(value: balance),
          totalExpense: Currency(value: totalExpense),
          totalIncome: Currency(value: totalIncome),
          economyPercent: economyPercent,
          spendingTooMuch: spendingTooMuch,
        ),
      );
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _loadAllAccounts() async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await getUserBankAccountsUseCase();

      double balanceInAccounts = 0;
      result.forEach((e) {
        balanceInAccounts += e.balance.value;
      });

      emit(
        state.copyWith(balanceInAccounts: Currency(value: balanceInAccounts)),
      );
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void nextMonth() {
    if (state.month == 1) {
      emit(state.copyWith(year: state.year + 1, month: 1));
    } else {
      emit(state.copyWith(month: state.month + 1));
    }
    _loadTransactionsMonth();
  }

  void previousMonth() {
    if (state.month == 12) {
      emit(state.copyWith(year: state.year - 1, month: 12));
    } else {
      emit(state.copyWith(month: state.month - 1));
    }
    _loadTransactionsMonth();
  }
}
