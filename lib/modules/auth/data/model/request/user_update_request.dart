import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/helpers/typedefs.dart';
import 'package:s_mobills/modules/auth/module.dart';

part 'user_update_request.freezed.dart';

@freezed
class UserUpdateRequest with _$UserUpdateRequest {
  factory UserUpdateRequest({
    required String name,
    required int age,
    required String email,
  }) = _UserUpdateRequest;

  UserUpdateRequest._();

  factory UserUpdateRequest.toData({required UserUpdate user}) {
    return UserUpdateRequest(
      name: user.name,
      age: user.age,
      email: user.email,
    );
  }

  static JSON toUpdateJson({
    String? name,
    int? age,
    String? email,
  }) {
    return <String, Object?>{
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (email != null) 'email': email,
    };
  }

  JSON toJson() {
    return <String, Object?>{
      'name': name,
      'age': age,
      'email': email,
    };
  }
}
