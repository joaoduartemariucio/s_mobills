// ignore_for_file: constant_pattern_never_matches_value_type, strict_raw_type

import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'package:s_mobills/modules/auth/data/model/request/user_request.dart';
import 'package:s_mobills/modules/auth/data/model/response/login_response.dart';
import 'package:s_mobills/modules/auth/data/model/response/user_response.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.http});

  final NetworkService http;

  @override
  Future<Result<UserResponse>> createAccount(
      {required UserRequest user}) async {
    final data = user.toJson();

    return http.performRequest<UserResponse>(
      request: AuthenticationEndpoint.createAccount.asRequest(),
      data: data,
      converter: UserResponse.fromJson,
    );
  }

  @override
  Future<Result<LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    return http.performRequest<LoginResponse>(
      request: AuthenticationEndpoint.login.asRequest(),
      data: {
        'email': email,
        'password': password,
      },
      converter: LoginResponse.fromJson,
    );
  }
}
