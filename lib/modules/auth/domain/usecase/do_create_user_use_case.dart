import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/auth/module.dart';

class DoCreateUserUseCase {
  const DoCreateUserUseCase({required this.repository});

  final AuthRepository repository;

  Future<void> call({required SignUpState state}) async {
    if (state.name.isEmpty ||
        state.name.isEmpty ||
        state.email.isEmpty ||
        state.password.isEmpty) {
      throw SMobillsException(message: 'Preencha todos os campos');
    }

    if (!Validator.isValidEmail(state.email.trim())) {
      throw SMobillsException(message: 'O E-mail digitado é inválido');
    }

    final user = User.toDomain(state: state);
    await repository.createAccount(user: user);
  }
}
