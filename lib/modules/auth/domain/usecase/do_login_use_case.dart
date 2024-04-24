import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/auth/module.dart';

class DoLoginUseCase {
  const DoLoginUseCase({required this.repository});

  final AuthRepository repository;

  Future<void> call({required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      throw SMobillsException(message: 'Por favor preencha todos os campos');
    }

    if (!Validator.isValidEmail(email.trim())) {
      throw SMobillsException(message: 'O E-mail digitado é inválido');
    }

    final result =
        await repository.login(email: email.trim(), password: password);
    await repository.saveToken(value: result.token);
  }
}
