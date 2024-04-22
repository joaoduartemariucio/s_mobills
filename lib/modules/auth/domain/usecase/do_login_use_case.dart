import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/auth/domain/repository/auth_repository.dart';

class DoLoginUseCase {
  const DoLoginUseCase({required this.repository});

  final AuthRepository repository;

  Future<void> call({required String email, required String password}) async {
    final result = await repository.login(email: email, password: password);

    if (result is Success) {
      await repository.saveToken(value: result.token);
    } else {
      throw SMobillsException(message: 'Login error');
    }
  }
}
