part of 'transaction_remote_data_source.dart';

final class TransactionRemoteDataSourceImpl
    extends TransactionRemoteDataSource {
  TransactionRemoteDataSourceImpl({required this.http});

  final NetworkService http;

  @override
  Future<Result<void>> newTransaction({
    required int bankAccountId,
    required NewTransactionRequest transaction,
  }) {
    return http.requestVoid(
      request: TransactionEndpoint.newTransaction
          .asRequest()
          .setParameter(parameter: bankAccountId),
      data: transaction.toJson(),
    );
  }

  @override
  Future<Result<List<TransactionResponse>>> getAllUseTransactions() {
    return http.requestList(
      request: TransactionEndpoint.userTransactions.asRequest(),
      converter: (data) => data
          .map((e) => TransactionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
