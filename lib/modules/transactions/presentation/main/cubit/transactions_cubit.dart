import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/navigation/routes/app_router.dart';
import 'package:s_mobills/modules/transactions/domain/model/transaction.dart';
import 'package:s_mobills/modules/transactions/domain/model/transaction_type.dart';

part 'transactions_state.dart';
part 'transactions_cubit.freezed.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(const TransactionsState.initial()) {
    _loadTransactions();
  }

  final floatingButtonKey = GlobalKey<ExpandableFabState>();

  void _loadTransactions() {
    final transactions = Transaction.generateRandomTransactions(5);
    emit(state.copyWith(transactions: transactions));
  }

  void addTransaction({required TransactionType type}) {
    _floatingButtonToggle();
    AppRouter.router.push(
      Routes.newTransaction.fullPath,
      extra: {'type': type},
    );
  }

  void _floatingButtonToggle() {
    final state = floatingButtonKey.currentState;
    if (state != null) {
      debugPrint('isOpen:${state.isOpen}');
      state.toggle();
    }
  }
}
