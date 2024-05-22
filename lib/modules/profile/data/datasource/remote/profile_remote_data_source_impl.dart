import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/core/networking/endpoints/bank_account_endpoint.dart';
import 'package:s_mobills/modules/profile/module.dart';

final class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl({required this.http});

  final NetworkService http;

  @override
  Future<Result<void>> newBankAccount({required CreateAccountRequest account}) {
    return http.requestVoid(
      request: BankAccountEndpoint.createAccount.asRequest(),
      data: account.toJson(),
    );
  }

  @override
  Future<Result<void>> updateBankAccount({
    required int id,
    required UpdateAccountRequest account,
  }) {
    return http.requestVoid(
      request: BankAccountEndpoint.updateAccount
          .asRequest()
          .setParameter(parameter: id),
      data: account.toJson(),
    );
  }

  @override
  Future<Result<void>> deleteBankAccount({required int id}) {
    return http.requestVoid(
      request: BankAccountEndpoint.deleteAccount
          .asRequest()
          .setParameter(parameter: id),
    );
  }

  @override
  Future<Result<List<BankAccountResponse>>> accounts() {
    return http.requestList<BankAccountResponse>(
      request: BankAccountEndpoint.accounts.asRequest(),
      converter: (json) {
        return json
            .map((e) => BankAccountResponse.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }
}
