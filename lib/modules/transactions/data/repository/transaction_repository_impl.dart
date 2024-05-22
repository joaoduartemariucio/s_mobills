part of '../../domain/repository/transaction_repository.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  TransactionRepositoryImpl({required this.remote});

  final TransactionRemoteDataSource remote;

  @override
  Future<void> createNewTransaction(
      {required NewTransaction transaction}) async {
    final data = NewTransactionRequest.toData(transaction: transaction);

    final result = await remote.newTransaction(
      bankAccountId: transaction.bankAccountId,
      transaction: data,
    );

    if (result is Success) {
      return;
    }

    throw result.exception!;
  }

  @override
  Future<List<Transaction>> getAllTransactions() async {
    final result = await remote.getAllUseTransactions();

    if (result is Failure) {
      throw result.exception!;
    }

    final data = result.data;

    if (data != null) {
      return data.map(Transaction.toDomain).toList();
    }

    throw SMobillsException.response();
  }
}
