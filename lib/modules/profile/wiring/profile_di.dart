import 'package:get_it/get_it.dart';
import 'package:s_mobills/modules/auth/domain/repository/auth_repository.dart';
import 'package:s_mobills/modules/profile/domain/domain.dart';

class ProfileDI {
  static void initializeDependencies() {
    _dataDependencies();
    _domainDependencies();
    _presentationDependencies();
  }
}

void _dataDependencies() {}

void _domainDependencies() {
  GetIt.I.registerLazySingleton<DoLogoutUserUseCase>(
    () => DoLogoutUserUseCase(
      repository: GetIt.I<AuthRepository>(),
    ),
  );

  GetIt.I.registerLazySingleton<DoGetUserInfoUseCase>(
    () => DoGetUserInfoUseCase(
      repository: GetIt.I<AuthRepository>(),
    ),
  );
}

void _presentationDependencies() {}
