import 'package:s_mobills/modules/auth/domain/model/user.dart';
import 'package:s_mobills/modules/auth/domain/repository/auth_repository.dart';

class DoGetUserInfoUseCase {
  const DoGetUserInfoUseCase({required this.repository});

  final AuthRepository repository;

  Future<User> call() async {
    return repository.info();
  }
}
