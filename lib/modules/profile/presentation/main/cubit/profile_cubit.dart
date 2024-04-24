import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/profile/module.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required this.doGetUserInfoUseCase,
    required this.doLogoutUserUseCase,
  }) : super(const ProfileState.initial());

  final DoGetUserInfoUseCase doGetUserInfoUseCase;
  final DoLogoutUserUseCase doLogoutUserUseCase;

  Future<void> info() async {
    try {
      emit(state.copyWith(isLoading: true));
      final user = await doGetUserInfoUseCase();
      emit(
        state.copyWith(
          name: user.name,
          email: user.email,
          initialLetters: StringHelper.extractInitials(user.name),
        ),
      );
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> editProfile() async {
    await AppRouter.router.push(Routes.profileEdit.fullPath);
  }

  Future<void> logout() async {
    try {
      await doLogoutUserUseCase();
      AppRouter.router.go(Routes.login.name);
    } on SMobillsException catch (e) {
      AppRouter.showError(message: e.message);
    } finally {}
  }
}
