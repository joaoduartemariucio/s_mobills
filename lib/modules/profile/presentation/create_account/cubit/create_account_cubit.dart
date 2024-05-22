import 'package:bloc/bloc.dart';
import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/profile/module.dart';

part 'create_account_state.dart';
part 'create_account_cubit.freezed.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit({required this.createNewBankAccountUseCase})
      : super(const CreateAccountState.initial()) {
    _textEditingListeners();
  }

  final CreateNewBankAccountUseCase createNewBankAccountUseCase;

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

  Future<void> saveAccount() async {
    try {
      emit(state.copyWith(isLoading: true));
      await createNewBankAccountUseCase(state: state);
      AppRouter.showSuccess(message: 'Conta criada com sucesso');
      AppRouter.router.pop();
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
