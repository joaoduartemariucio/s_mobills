import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/transactions/module.dart';

part 'transactions_state.dart';
part 'transactions_cubit.freezed.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit({
    required this.getTransactionsPeriodUseCase,
  }) : super(const TransactionsState.initial()) {
    _loadTransactions();
  }

  final GetTransactionsPeriodUseCase getTransactionsPeriodUseCase;

  final floatingButtonKey = GlobalKey<ExpandableFabState>();

  Future<void> _loadTransactions() async {
    emit(
      state.copyWith(
        isLoading: true,
        year: DateTime.now().year,
        month: DateTime.now().month,
      ),
    );

    await _getTransactions();
  }

  Future<void> _getTransactions() async {
    try {
      final start = DateHelper.firstDayMonth(state.year, state.month);
      final end = DateHelper.lastDayMonth(state.year, state.month);

      final result = await getTransactionsPeriodUseCase(
        start: start,
        end: end,
      );
      emit(state.copyWith(transactions: result));
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> addTransaction({required TransactionType type}) async {
    _floatingButtonToggle();
    await AppRouter.router.pushNamed(
      Routes.newTransaction.name,
      extra: {'type': type},
    );

    await _loadTransactions();
  }

  Future<void> editTransaction({required Transaction transaction}) async {
    await AppRouter.router.pushNamed(
      Routes.editTransaction.name,
      extra: transaction,
    );

    await _loadTransactions();
  }

  void _floatingButtonToggle() {
    final state = floatingButtonKey.currentState;
    if (state != null) {
      debugPrint('isOpen:${state.isOpen}');
      state.toggle();
    }
  }

  void nextMonth() {
    if (state.month == 1) {
      emit(state.copyWith(year: state.year + 1, month: 1));
    } else {
      emit(state.copyWith(month: state.month + 1));
    }
    _getTransactions();
  }

  void previousMonth() {
    if (state.month == 12) {
      emit(state.copyWith(year: state.year - 1, month: 12));
    } else {
      emit(state.copyWith(month: state.month - 1));
    }
    _getTransactions();
  }
}
