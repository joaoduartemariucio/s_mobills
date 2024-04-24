import 'package:s_mobills/modules/auth/module.dart';

abstract class AuthRepository {
  Future<User> createAccount({required User user});

  Future<Token> login({required String email, required String password});

  Future<User> info();

  Future<User> update({required UserUpdate user});

  Future<void> saveToken({required String value});

  Future<void> delete();

  Future<void> removeToken();

  Future<void> logout();
}
