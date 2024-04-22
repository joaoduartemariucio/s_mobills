import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:s_mobills/core/helpers/typedefs.dart';
import 'package:s_mobills/modules/auth/domain/model/user.dart';

part 'user_request.freezed.dart';

class AppUtils {
  /// A utility method to convert any instance to null
  static T? toNull<T>(Object? _) => null;
}

@freezed
class UserRequest with _$UserRequest {
  factory UserRequest({
    required String name,
    required int age,
    required String email,
    required String password,
  }) = _UserRequest;

  UserRequest._();

  factory UserRequest.toData({required User user}) {
    return UserRequest(
      name: user.name,
      age: user.age,
      email: user.email,
      password: user.password,
    );
  }

  static JSON toUpdateJson({
    String? name,
    int? age,
    String? email,
    String? password,
  }) {
    return <String, Object?>{
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
    };
  }

  JSON toJson() {
    return <String, Object?>{
      'name': name,
      'age': age,
      'email': email,
      'password': password,
    };
  }
}
