import 'package:s_mobills/modules/auth/domain/repository/auth_repository.dart';

class DoLoginUseCase {
  const DoLoginUseCase({required this.repository});

  final AuthRepository repository;

  Future<void> call({required String email, required String password}) async {
    final result = await repository.login(email: email, password: password);
    await repository.saveToken(value: result.token);
  }
}
