// ignore_for_file: inference_failure_on_instance_creation

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/core/navigation/routes/app_router.dart';

part 'splash_state.dart';
part 'splash_cubit.freezed.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.storage}) : super(const SplashState.initial());

  final KeyValueStorageService storage;

  Future<void> checkIfUserAuthenticated() async {
    final token = await storage.getAuthToken();

    await Future.delayed(const Duration(seconds: 3));

    if (token.isEmpty) {
      AppRouter.router.go(Routes.login.name);
    } else {
      AppRouter.router.go(Routes.home.name);
    }
  }
}
