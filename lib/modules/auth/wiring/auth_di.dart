import 'package:get_it/get_it.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/core/networking/network_service.dart';
import 'package:s_mobills/modules/auth/data/datasource/local/auth_local_datasource.dart';
import 'package:s_mobills/modules/auth/data/datasource/local/auth_local_datasource_impl.dart';
import 'package:s_mobills/modules/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:s_mobills/modules/auth/data/datasource/remote/auth_remote_datasource_impl.dart';
import 'package:s_mobills/modules/auth/data/repository/auth_repository_impl.dart';
import 'package:s_mobills/modules/auth/domain/repository/auth_repository.dart';
import 'package:s_mobills/modules/auth/domain/usecase/do_create_user_use_case.dart';
import 'package:s_mobills/modules/auth/domain/usecase/do_login_use_case.dart';

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
