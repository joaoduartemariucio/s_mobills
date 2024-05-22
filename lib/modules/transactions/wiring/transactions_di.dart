import 'package:get_it/get_it.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/transactions/domain/usecase/new_transaction_use_case.dart';

class TransactionDI {
  static void initializeDependencies() {
    _dataDependencies();
    _domainDependencies();
  }
}

void _dataDependencies() {}

void _domainDependencies() {
  _useCasesDependencies();
}

void _useCasesDependencies() {
  GetIt.I.registerLazySingleton<NewTransactionUseCase>(
    NewTransactionUseCase.new,
  );
}
