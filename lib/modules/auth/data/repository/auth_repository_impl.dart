import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/auth/module.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this.remote,
    required this.local,
  });

  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;

  @override
  Future<User> createAccount({required User user}) async {
    final data = UserRequest.toData(user: user);
    final result = await remote.createAccount(user: data);

    if (result is Success) {
      return User.fromData(data: result.data!);
    }

    throw result.exception!;
  }

  @override
  Future<Token> login({required String email, required String password}) async {
    final result = await remote.login(email: email, password: password);

    if (result is Success) {
      return Token.fromData(response: result.data!);
    }

    throw result.exception!;
  }

  @override
  Future<User> info() async {
    final result = await remote.info();

    if (result is Success) {
      return User.fromData(data: result.data!);
    }

    throw result.exception!;
  }

  @override
  Future<void> update({required UserUpdate user}) async {
    final data = UserUpdateRequest.toData(user: user);

    final result = await remote.update(user: data);

    if (result is Success) {
      return;
    }

    throw result.exception!;
  }

  @override
  Future<void> delete() async {
    final result = await remote.delete();

    if (result is Success) {
      return;
    }

    throw result.exception!;
  }

  @override
  Future<void> saveToken({required String value}) async {
    await local.saveToken(value: value);
  }

  @override
  Future<void> removeToken() async {
    await local.removeToken();
  }

  @override
  Future<void> logout() async {
    final result = await remote.logout();

    if (result is Success) {
      return;
    }

    throw result.exception!;
  }
}
