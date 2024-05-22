import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/profile/module.dart';

final class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl({required this.http});

  final NetworkService http;

  @override
  Future<Result<void>> newBankAccount({required CreateAccountRequest account}) {
    return http.requestVoid(
      request: AuthenticationEndpoint.edit.asRequest(),
      data: account.toJson(),
    );
  }
}
