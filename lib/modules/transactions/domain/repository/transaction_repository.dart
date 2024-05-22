import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/transactions/module.dart';

part '../../data/repository/transaction_repository_impl.dart';

abstract class TransactionRepository {
  Future<void> createNewTransaction({
    required NewTransaction transaction,
  });

  Future<List<Transaction>> getAllTransactions();
}
