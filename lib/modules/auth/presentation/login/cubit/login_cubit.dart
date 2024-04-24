import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/auth/module.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.doLoginUseCase})
      : super(const LoginState.initial()) {
    _textEditingListeners();
  }

  final DoLoginUseCase doLoginUseCase;
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  void _textEditingListeners() {
    emailTextEditingController.addListener(() {
      emit(state.copyWith(email: emailTextEditingController.text));
    });

    passwordTextEditingController.addListener(() {
      emit(state.copyWith(password: passwordTextEditingController.text));
    });
  }

  Future<void> login() async {
    try {
      emit(state.copyWith(isLoading: true));

      await doLoginUseCase(email: state.email, password: state.password);

      AppRouter.router.go(Routes.home.name);
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void signUp() {
    AppRouter.router.push(Routes.sign.name);
  }
}
