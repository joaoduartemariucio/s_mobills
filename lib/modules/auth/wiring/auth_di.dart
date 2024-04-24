import 'package:get_it/get_it.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/auth/module.dart';

class AuthDI {
  static void initializeDependencies() {
    _dataDependencies();
    _domainDependencies();
    _presentationDependencies();
  }
}

void _dataDependencies() {
  GetIt.I.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      http: GetIt.I<NetworkService>(),
    ),
  );

  GetIt.I.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      secureStorage: GetIt.I<KeyValueStorageService>(),
    ),
  );

  GetIt.I.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remote: GetIt.I<AuthRemoteDataSource>(),
      local: GetIt.I<AuthLocalDataSource>(),
    ),
  );
}

void _domainDependencies() {
  GetIt.I.registerLazySingleton<DoCreateUserUseCase>(
    () => DoCreateUserUseCase(
      repository: GetIt.I<AuthRepository>(),
    ),
  );

  GetIt.I.registerLazySingleton<DoLoginUseCase>(
    () => DoLoginUseCase(
      repository: GetIt.I<AuthRepository>(),
    ),
  );
}

void _presentationDependencies() {}
