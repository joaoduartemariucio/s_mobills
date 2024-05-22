import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/profile/module.dart';

abstract class ProfileRemoteDataSource {
  Future<Result<void>> newBankAccount({required CreateAccountRequest account});
}
