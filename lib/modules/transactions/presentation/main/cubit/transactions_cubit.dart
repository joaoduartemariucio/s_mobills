import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/transactions/module.dart';

part 'transactions_state.dart';
part 'transactions_cubit.freezed.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit({required this.getAllUserTransactionsUseCase})
      : super(const TransactionsState.initial()) {
    _loadTransactions();
  }

  final GetAllUserTransactionsUseCase getAllUserTransactionsUseCase;

  final floatingButtonKey = GlobalKey<ExpandableFabState>();

  Future<void> _loadTransactions() async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await getAllUserTransactionsUseCase();
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
}
