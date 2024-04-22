import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/auth/data/model/request/user_request.dart';
import 'package:s_mobills/modules/auth/data/model/response/login_response.dart';
import 'package:s_mobills/modules/auth/data/model/response/user_response.dart';

abstract class AuthRemoteDataSource {
  Future<Result<UserResponse>> createAccount({required UserRequest user});

  Future<Result<LoginResponse>> login({
    required String email,
    required String password,
  });
}
