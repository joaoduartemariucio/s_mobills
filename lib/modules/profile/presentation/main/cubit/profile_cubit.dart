import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/core/navigation/routes/app_router.dart';
import 'package:s_mobills/modules/profile/domain/usecase/do_logout_user_use_case.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.doLogoutUserUseCase})
      : super(const ProfileState.initial());

  final DoLogoutUserUseCase doLogoutUserUseCase;

  Future<void> info() async {}

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
