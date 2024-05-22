import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/profile/module.dart';

abstract class ProfileRemoteDataSource {
  Future<Result<void>> newBankAccount({required CreateAccountRequest account});
  Future<Result<void>> deleteBankAccount({required int id});
  Future<Result<void>> updateBankAccount({
    required int id,
    required UpdateAccountRequest account,
  });
  Future<Result<List<BankAccountResponse>>> accounts();
}
