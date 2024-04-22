import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/helpers/typedefs.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  factory LoginResponse({
    required String token,
  }) = _LoginResponse;

  LoginResponse._();

  factory LoginResponse.fromJson(JSON json) => _$LoginResponseFromJson(json);
}
