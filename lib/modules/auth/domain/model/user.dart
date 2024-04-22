import 'package:s_mobills/modules/auth/data/model/response/user_response.dart';
import 'package:s_mobills/modules/auth/presentation/sign_up/cubit/sign_up_cubit.dart';

class User {
  const User({
    this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.password,
  });

  factory User.toDomain({required SignUpState state}) {
    return User(
      name: state.name,
      age: int.parse(state.age),
      email: state.email,
      password: state.password,
    );
  }

  factory User.fromData({required UserResponse data}) {
    return User(
      id: data.id,
      name: data.name,
      age: data.age,
      email: data.email,
      password: data.password,
    );
  }

  final int? id;
  final String name;
  final int age;
  final String email;
  final String password;
}
