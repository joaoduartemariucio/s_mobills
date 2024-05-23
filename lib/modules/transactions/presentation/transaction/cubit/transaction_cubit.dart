// ignore_for_file: avoid_positional_boolean_parameters, avoid_redundant_argument_values

import 'package:bloc/bloc.dart';
import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/profile/module.dart';
import 'package:s_mobills/modules/transactions/module.dart';
import 'package:s_mobills/ui/ui.dart';

part 'transaction_state.dart';
part 'transaction_cubit.freezed.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit({
    required this.deleteTransactionUseCase,
    required this.newTransactionUseCase,
    required this.updateTransactionUseCase,
  }) : super(const TransactionState.initial()) {
    _textEditingListeners();
  }

  final DeleteTransactionUseCase deleteTransactionUseCase;
  final NewTransactionUseCase newTransactionUseCase;
  final UpdateTransactionUseCase updateTransactionUseCase;

  final TextEditingController descriptionTextEditingController =
      TextEditingController();

  final CurrencyTextFieldController
      transactionValueCurrencyTextFieldController = CurrencyTextFieldController(
    currencySymbol: r'R$',
    decimalSymbol: ',',
    thousandSymbol: '.',
    initDoubleValue: 0,
  );

  void setupTransactionType({required TransactionType transactionType}) {
    emit(
      state.copyWith(
        transactionType: transactionType,
        categoryType: transactionType == TransactionType.income
            ? CategoryType.investments
            : CategoryType.food,
      ),
    );
    onChangeSelectedDate(DateTime.now());
  }

  void setupTransaction({required Transaction transaction}) {
    transactionValueCurrencyTextFieldController.text =
        transaction.value.formatted;
    descriptionTextEditingController.text = transaction.description;

    emit(
      state.copyWith(
        transactionId: transaction.id,
        bankAccountId: transaction.accountId,
        bankAccountName: 'Conta origem',
        description: transaction.description,
        transactionValue: transaction.value.value,
        done: transaction.done,
        selectedDate: transaction.date,
        transactionType: transaction.type,
        categoryType: transaction.category,
      ),
    );
  }

  void _textEditingListeners() {
    descriptionTextEditingController.addListener(() {
      emit(state.copyWith(description: descriptionTextEditingController.text));
    });

    transactionValueCurrencyTextFieldController.addListener(() {
      emit(
        state.copyWith(
          transactionValue:
              transactionValueCurrencyTextFieldController.doubleValue,
        ),
      );
    });
  }

  void onChangedDone(bool value) {
    emit(state.copyWith(done: value));
  }

  void onChangeSelectedDate(DateTime? date) {
    if (date != null) {
      final showAllDateOptions = date.isToday || date.isYesterday;

      emit(
        state.copyWith(
          selectedDate: date,
          showAllDateOptions: showAllDateOptions,
        ),
      );
    }
  }

  void onChangeSelectedCategory(CategoryType type) {
    emit(state.copyWith(categoryType: type));
  }

  void onChangeSelectedBankAccount(BankAccount account) {
    emit(
      state.copyWith(
        bankAccountId: account.id,
        bankAccountName: account.name,
      ),
    );
  }

  Future<void> deleteTransaction() async {
    try {
      emit(state.copyWith(isLoading: true));
      await deleteTransactionUseCase(transactionId: state.transactionId);
      AppRouter.showSuccess(message: 'Transação deletada com sucesso');
      AppRouter.router.pop();
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> saveTransaction() async {
    if (state.transactionId != -1) {
      return updateTransaction();
    }
    return createNewTransaction();
  }

  Future<void> updateTransaction() async {
    try {
      emit(state.copyWith(isLoading: true));
      await updateTransactionUseCase(state: state);
      AppRouter.showSuccess(message: 'Transação editada com sucesso');
      AppRouter.router.pop();
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> createNewTransaction() async {
    try {
      emit(state.copyWith(isLoading: true));
      await newTransactionUseCase(state: state);
      AppRouter.showSuccess(message: 'Nova transação adicionada com sucesso');
      AppRouter.router.pop();
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
