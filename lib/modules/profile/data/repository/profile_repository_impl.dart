import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/profile/module.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl({required this.remote});

  final ProfileRemoteDataSource remote;

  @override
  Future<void> createAccount({required CreateAccount account}) async {
    final data = CreateAccountRequest.toData(account: account);

    final result = await remote.newBankAccount(account: data);

    if (result is Success) {
      return;
    }

    throw result.exception!;
  }
}
