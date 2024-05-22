import 'package:s_mobills/modules/transactions/module.dart';

class GetAllUserTransactionsUseCase {
  GetAllUserTransactionsUseCase({required this.repository});

  final TransactionRepository repository;

  Future<List<Transaction>> call() async {
    return repository.getAllTransactions();
  }
}
