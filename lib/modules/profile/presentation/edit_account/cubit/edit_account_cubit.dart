import 'package:bloc/bloc.dart';
import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/modules.dart';

part 'edit_account_state.dart';
part 'edit_account_cubit.freezed.dart';

class EditAccountCubit extends Cubit<EditAccountState> {
  EditAccountCubit({
    required this.deleteBankAccountUseCase,
    required this.updateBankAccountUseCase,
  }) : super(const EditAccountState.initial()) {
    _textEditingListeners();
  }

  final DeleteBankAccountUseCase deleteBankAccountUseCase;
  final UpdateBankAccountUseCase updateBankAccountUseCase;

  final TextEditingController accountNameEditController =
      TextEditingController();

  final CurrencyTextFieldController accountBalanceEditController =
      CurrencyTextFieldController(
    currencySymbol: r"R$",
    decimalSymbol: ",",
    thousandSymbol: ".",
    initDoubleValue: 0,
  );

  void _textEditingListeners() {
    accountNameEditController.addListener(() {
      emit(state.copyWith(name: accountNameEditController.text));
    });

    accountBalanceEditController.addListener(() {
      emit(
        state.copyWith(
          balance: accountBalanceEditController.doubleValue,
        ),
      );
    });
  }

  void loadAccount({required BankAccount account}) {
    accountNameEditController.text = account.name;
    accountBalanceEditController.text = account.balance.formatted;
    emit(state.copyWith(id: account.id));
  }

  Future<void> saveAccount() async {
    try {
      emit(state.copyWith(isSaveLoading: true));
      await updateBankAccountUseCase(state: state);
      AppRouter.showSuccess(message: 'Conta editada com sucesso');
      AppRouter.router.pop();
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {
      emit(state.copyWith(isSaveLoading: false));
    }
  }

  Future<void> deleteAccount() async {
    try {
      emit(state.copyWith(isDeleteLoading: true));
      await deleteBankAccountUseCase(id: state.id);
      AppRouter.showSuccess(message: 'Conta deletada com sucesso');
      AppRouter.router.pop();
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {
      emit(state.copyWith(isDeleteLoading: false));
    }
  }
}
