import 'package:s_mobills/modules/auth/module.dart';

class DoDeleteUserUseCase {
  const DoDeleteUserUseCase({required this.repository});

  final AuthRepository repository;

  Future<void> call() async {
    return repository.delete();
  }
}
