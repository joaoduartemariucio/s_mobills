import 'package:s_mobills/modules/transactions/module.dart';

class DeleteTransactionUseCase {
  DeleteTransactionUseCase({required this.repository});

  final TransactionRepository repository;

  Future<void> call({required int transactionId}) async {
    return repository.deleteTransaction(transactionId: transactionId);
  }
}
