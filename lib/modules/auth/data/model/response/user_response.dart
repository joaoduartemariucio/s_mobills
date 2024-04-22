import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/helpers/typedefs.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  factory UserResponse({
    required int id,
    required String name,
    required int age,
    required String email,
    required String password,
    required String? token,
    required String? account,
  }) = _UserResponse;

  UserResponse._();

  factory UserResponse.fromJson(JSON json) => _$UserResponseFromJson(json);
}
