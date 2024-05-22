import 'package:s_mobills/modules/profile/module.dart';

abstract class ProfileRepository {
  Future<void> createAccount({required CreateAccount account});
}
