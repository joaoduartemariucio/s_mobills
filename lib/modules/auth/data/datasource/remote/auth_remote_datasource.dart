import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/auth/module.dart';

abstract class AuthRemoteDataSource {
  Future<Result<UserResponse>> createAccount({required UserRequest user});

  Future<Result<LoginResponse>> login({
    required String email,
    required String password,
  });

  Future<Result<UserResponse>> info();

  Future<Result<void>> logout();
}
