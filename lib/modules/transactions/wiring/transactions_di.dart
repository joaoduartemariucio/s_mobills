import 'package:get_it/get_it.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/transactions/module.dart';

class TransactionDI {
  static void initializeDependencies() {
    _dataDependencies();
    _domainDependencies();
  }
}

void _dataDependencies() {
  GetIt.I.registerLazySingleton<TransactionRemoteDataSource>(
    () => TransactionRemoteDataSourceImpl(
      http: GetIt.I<NetworkService>(),
    ),
  );
}

void _domainDependencies() {
  GetIt.I.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(
      remote: GetIt.I<TransactionRemoteDataSource>(),
    ),
  );
  _useCasesDependencies();
}

void _useCasesDependencies() {
  GetIt.I.registerLazySingleton<NewTransactionUseCase>(
    () => NewTransactionUseCase(
      repository: GetIt.I<TransactionRepository>(),
    ),
  );

  GetIt.I.registerLazySingleton<GetAllUserTransactionsUseCase>(
    () => GetAllUserTransactionsUseCase(
      repository: GetIt.I<TransactionRepository>(),
    ),
  );
}
