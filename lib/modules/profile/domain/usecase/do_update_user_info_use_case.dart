import 'package:s_mobills/modules/auth/module.dart';
import 'package:s_mobills/modules/profile/module.dart';

class DoUpdateUserInfoUseCase {
  const DoUpdateUserInfoUseCase({required this.repository});

  final AuthRepository repository;

  Future<User> call({required EditState state}) async {
    final user = UserUpdate.toDomain(state: state);
    return repository.update(user: user);
  }
}
