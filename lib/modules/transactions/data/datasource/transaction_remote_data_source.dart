import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/transactions/module.dart';

part 'transaction_remote_data_source_impl.dart';

abstract class TransactionRemoteDataSource {
  Future<Result<void>> newTransaction({
    required int bankAccountId,
    required TransactionRequest transaction,
  });

  Future<Result<void>> updateTransaction({
    required int id,
    required TransactionRequest transaction,
  });

  Future<Result<void>> deleteTransaction({required int id});

  Future<Result<List<TransactionResponse>>> getAllUseTransactions();
}
