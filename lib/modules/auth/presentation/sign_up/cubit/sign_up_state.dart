part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    required this.name,
    required this.age,
    required this.email,
    required this.password,
    required this.isLoading,
  });

  factory SignUpState.initial() {
    return const SignUpState(
      name: '',
      age: '',
      email: '',
      password: '',
      isLoading: false,
    );
  }

  final String name;
  final String age;
  final String email;
  final String password;
  final bool isLoading;

  @override
  List<Object?> get props => [
        name,
        age,
        email,
        password,
      ];

  SignUpState copyWith({
    String? name,
    String? age,
    String? email,
    String? password,
    bool? isLoading,
  }) {
    return SignUpState(
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() {
    return 'SignUpState { name: $name, age: $age, email: $email, password: $password isLoading: $isLoading}';
  }
}
