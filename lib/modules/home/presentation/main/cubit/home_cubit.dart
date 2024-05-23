import 'package:bloc/bloc.dart';
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

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getTransactionsPeriodUseCase,
  }) : super(const HomeState.initial()) {
    loadLastSevenDays();
  }

  final GetTransactionsPeriodUseCase getTransactionsPeriodUseCase;

  Future<void> loadLastSevenDays() async {
    try {
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

      emit(
        state.copyWith(
          lastSevenDaysExpense: days.reversed.toList(),
        ),
      );
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {
      // emit(state.copyWith(isLoading: false));
    }
  }
}
