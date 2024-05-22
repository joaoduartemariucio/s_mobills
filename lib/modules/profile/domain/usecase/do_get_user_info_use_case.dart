import 'package:s_mobills/modules/auth/module.dart';

class DoGetUserInfoUseCase {
  const DoGetUserInfoUseCase({required this.repository});

  final AuthRepository repository;

  Future<User> call() async {
    return repository.info();
  }
}
