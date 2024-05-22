import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/profile/domain/domain.dart';
import 'package:s_mobills/modules/profile/module.dart';

part 'edit_state.dart';
part 'edit_cubit.freezed.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit({
    required this.doGetUserInfoUseCase,
    required this.doUpdateUserInfoUseCase,
    required this.doDeleteUserUseCase,
    required this.doLogoutUserUseCase,
  }) : super(const EditState.initial()) {
    _textEditingListeners();
  }

  DoGetUserInfoUseCase doGetUserInfoUseCase;
  DoUpdateUserInfoUseCase doUpdateUserInfoUseCase;
  DoDeleteUserUseCase doDeleteUserUseCase;
  DoLogoutUserUseCase doLogoutUserUseCase;

  final TextEditingController nameEditController = TextEditingController();
  final TextEditingController ageEditController = TextEditingController();
  final TextEditingController emailEditController = TextEditingController();

  void _textEditingListeners() {
    nameEditController.addListener(() {
      emit(state.copyWith(name: nameEditController.text));
    });

    ageEditController.addListener(() {
      emit(state.copyWith(age: ageEditController.text));
    });
  }

  Future<void> getInfo() async {
    try {
      final result = await doGetUserInfoUseCase();
      emit(
        state.copyWith(
          id: result.id ?? 0,
          name: result.name,
          age: result.age.toString(),
          email: result.email,
        ),
      );

      nameEditController.text = result.name;
      ageEditController.text = result.age.toString();
      emailEditController.text = result.email;
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    }
  }

  Future<void> updateInfo() async {
    try {
      emit(state.copyWith(isLoading: true));
      await doUpdateUserInfoUseCase(state: state);
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> deleteAccount() async {
    try {
      emit(state.copyWith(startDeleteAccount: true));
      await doDeleteUserUseCase();
      await doLogoutUserUseCase();
      AppRouter.router.goNamed(Routes.login.name);
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {
      emit(state.copyWith(startDeleteAccount: false));
    }
  }
}
