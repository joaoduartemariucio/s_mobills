import 'package:s_mobills/modules/transactions/module.dart';

class GetTransactionsPeriodUseCase {
  GetTransactionsPeriodUseCase({required this.repository});

  final TransactionRepository repository;

  Future<List<Transaction>> call({
    required DateTime start,
    required DateTime end,
  }) async {
    return repository.getTransactionsPeriod(start: start, end: end);
  }
}
