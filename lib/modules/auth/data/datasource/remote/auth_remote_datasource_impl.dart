// ignore_for_file: constant_pattern_never_matches_value_type, strict_raw_type

import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/auth/module.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.http});

  final NetworkService http;

  @override
  Future<Result<UserResponse>> createAccount({
    required UserRequest user,
  }) async {
    final data = user.toJson();

    return http.requestJSON<UserResponse>(
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
    return http.requestJSON<LoginResponse>(
      request: AuthenticationEndpoint.login.asRequest(),
      data: {
        'email': email,
        'password': password,
      },
      converter: LoginResponse.fromJson,
    );
  }

  @override
  Future<Result<UserResponse>> info() async {
    return http.requestJSON<UserResponse>(
      request: AuthenticationEndpoint.info.asRequest(),
      converter: UserResponse.fromJson,
    );
  }

  @override
  Future<Result<void>> update({required UserUpdateRequest user}) {
    return http.requestVoid(
      request: AuthenticationEndpoint.edit.asRequest(),
      data: user.toJson(),
    );
  }

  @override
  Future<Result<void>> delete() {
    return http.requestVoid(
      request: AuthenticationEndpoint.deleteAccount.asRequest(),
    );
  }

  @override
  Future<Result<void>> logout() async {
    return http.requestVoid(
      request: AuthenticationEndpoint.logout.asRequest(),
    );
  }
}
