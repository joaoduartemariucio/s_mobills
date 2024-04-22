import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/auth/data/datasource/local/auth_local_datasource.dart';
import 'package:s_mobills/modules/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:s_mobills/modules/auth/data/model/request/user_request.dart';
import 'package:s_mobills/modules/auth/domain/model/token.dart';
import 'package:s_mobills/modules/auth/domain/model/user.dart';
import 'package:s_mobills/modules/auth/domain/repository/auth_repository.dart';

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
  Future<void> saveToken({required String value}) async {
    await local.saveToken(value: value);
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
