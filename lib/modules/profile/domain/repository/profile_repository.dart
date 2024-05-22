import 'package:s_mobills/modules/profile/module.dart';

abstract class ProfileRepository {
  Future<void> createAccount({required CreateAccount account});
  Future<void> updateAccount({required BankAccount account});
  Future<void> deleteAccount({required int id});
  Future<List<BankAccount>> accounts();
}
