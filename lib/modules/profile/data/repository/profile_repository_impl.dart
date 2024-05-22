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

  @override
  Future<void> updateAccount({required BankAccount account}) async {
    final data = UpdateAccountRequest.toData(account: account);

    final result = await remote.updateBankAccount(
      id: account.id,
      account: data,
    );

    if (result is Success) {
      return;
    }

    throw result.exception!;
  }

  @override
  Future<void> deleteAccount({required int id}) async {
    final result = await remote.deleteBankAccount(id: id);

    if (result is Success) {
      return;
    }

    throw result.exception!;
  }

  @override
  Future<List<BankAccount>> accounts() async {
    final result = await remote.accounts();

    if (result is Failure) {
      throw result.exception!;
    }

    final data = result.data;

    if (data != null) {
      return data.map((e) => BankAccount.toDomain(response: e)).toList();
    }

    throw SMobillsException.response();
  }
}
