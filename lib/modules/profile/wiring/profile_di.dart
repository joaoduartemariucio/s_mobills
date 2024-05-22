import 'package:get_it/get_it.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/auth/module.dart';
import 'package:s_mobills/modules/profile/module.dart';

class ProfileDI {
  static void initializeDependencies() {
    _dataDependencies();
    _domainDependencies();
  }
}

void _dataDependencies() {
  GetIt.I.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
      http: GetIt.I<NetworkService>(),
    ),
  );
}

void _domainDependencies() {
  GetIt.I.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remote: GetIt.I<ProfileRemoteDataSource>(),
    ),
  );

  _useCasesDependencies();
}

void _useCasesDependencies() {
  GetIt.I.registerLazySingleton<GetUserBankAccountsUseCase>(
    () => GetUserBankAccountsUseCase(
      repository: GetIt.I<ProfileRepository>(),
    ),
  );

  GetIt.I.registerLazySingleton<UpdateBankAccountUseCase>(
    () => UpdateBankAccountUseCase(
      repository: GetIt.I<ProfileRepository>(),
    ),
  );

  GetIt.I.registerLazySingleton<DeleteBankAccountUseCase>(
    () => DeleteBankAccountUseCase(
      repository: GetIt.I<ProfileRepository>(),
    ),
  );

  GetIt.I.registerLazySingleton<CreateNewBankAccountUseCase>(
    () => CreateNewBankAccountUseCase(
      repository: GetIt.I<ProfileRepository>(),
    ),
  );

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

  GetIt.I.registerLazySingleton<DoUpdateUserInfoUseCase>(
    () => DoUpdateUserInfoUseCase(
      repository: GetIt.I<AuthRepository>(),
    ),
  );

  GetIt.I.registerLazySingleton<DoDeleteUserUseCase>(
    () => DoDeleteUserUseCase(
      repository: GetIt.I<AuthRepository>(),
    ),
  );
}
