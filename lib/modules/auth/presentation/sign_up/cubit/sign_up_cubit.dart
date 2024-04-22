import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/core/navigation/routes/app_router.dart';
import 'package:s_mobills/modules/auth/domain/usecase/do_create_user_use_case.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required this.doCreateUserUseCase,
  }) : super(SignUpState.initial()) {
    _textEditingListeners();
  }

  final DoCreateUserUseCase doCreateUserUseCase;

  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController ageTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  void _textEditingListeners() {
    nameTextEditingController.addListener(() {
      emit(state.copyWith(name: nameTextEditingController.text));
    });

    ageTextEditingController.addListener(() {
      emit(state.copyWith(age: ageTextEditingController.text));
    });

    emailTextEditingController.addListener(() {
      emit(state.copyWith(email: emailTextEditingController.text));
    });

    passwordTextEditingController.addListener(() {
      emit(state.copyWith(password: passwordTextEditingController.text));
    });
  }

  Future<void> createAccount() async {
    try {
      emit(state.copyWith(isLoading: true));
      await doCreateUserUseCase(state: state);
      AppRouter.router.pop({'email': state.email, 'password': state.password});
    } on SMobillsException catch (e) {
      print(e);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
