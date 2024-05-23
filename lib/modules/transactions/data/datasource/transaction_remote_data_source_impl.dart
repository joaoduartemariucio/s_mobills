part of 'transaction_remote_data_source.dart';

final class TransactionRemoteDataSourceImpl
    extends TransactionRemoteDataSource {
  TransactionRemoteDataSourceImpl({required this.http});

  final NetworkService http;

  @override
  Future<Result<void>> newTransaction({
    required int bankAccountId,
    required TransactionRequest transaction,
  }) {
    return http.requestVoid(
      request: TransactionEndpoint.newTransaction
          .asRequest()
          .setParameter(parameter: bankAccountId),
      data: transaction.toJson(),
    );
  }

  @override
  Future<Result<void>> updateTransaction({
    required int id,
    required TransactionRequest transaction,
  }) {
    return http.requestVoid(
      request: TransactionEndpoint.updateTransaction
          .asRequest()
          .setParameter(parameter: id),
      data: transaction.toJson(),
    );
  }

  @override
  Future<Result<void>> deleteTransaction({required int id}) {
    return http.requestVoid(
      request: TransactionEndpoint.deleteTransaction
          .asRequest()
          .setParameter(parameter: id),
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
