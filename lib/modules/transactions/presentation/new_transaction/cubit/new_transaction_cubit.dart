// ignore_for_file: avoid_positional_boolean_parameters

import 'package:bloc/bloc.dart';
import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/profile/module.dart';
import 'package:s_mobills/modules/transactions/module.dart';
import 'package:s_mobills/ui/ui.dart';

part 'new_transaction_state.dart';
part 'new_transaction_cubit.freezed.dart';

class NewTransactionCubit extends Cubit<NewTransactionState> {
  NewTransactionCubit({required this.newTransactionUseCase})
      : super(const NewTransactionState.initial());

  final NewTransactionUseCase newTransactionUseCase;

  final TextEditingController descriptionTextEditingController =
      TextEditingController();

  final CurrencyTextFieldController
      transactionValueCurrencyTextFieldController = CurrencyTextFieldController(
    currencySymbol: r"R$",
    decimalSymbol: ",",
    thousandSymbol: ".",
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
    _textEditingListeners();
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

  Future<void> saveTransaction() async {
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
