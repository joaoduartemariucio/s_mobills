import 'package:s_mobills/modules/auth/domain/model/user.dart';
import 'package:s_mobills/modules/auth/domain/repository/auth_repository.dart';
import 'package:s_mobills/modules/auth/presentation/sign_up/cubit/sign_up_cubit.dart';

class DoCreateUserUseCase {
  const DoCreateUserUseCase({required this.repository});

  final AuthRepository repository;

  Future<void> call({required SignUpState state}) async {
    final user = User.toDomain(state: state);
    await repository.createAccount(user: user);
  }
}
