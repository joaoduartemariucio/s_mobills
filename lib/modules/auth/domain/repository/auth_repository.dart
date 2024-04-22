import 'package:s_mobills/modules/auth/domain/model/token.dart';
import 'package:s_mobills/modules/auth/domain/model/user.dart';

abstract class AuthRepository {
  Future<User> createAccount({required User user});

  Future<Token> login({required String email, required String password});

  Future<void> saveToken({required String value});

  Future<void> logout();
}
