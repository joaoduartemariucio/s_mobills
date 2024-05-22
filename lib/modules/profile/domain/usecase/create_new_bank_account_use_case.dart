import 'package:s_mobills/modules/profile/module.dart';

class CreateNewBankAccountUseCase {
  CreateNewBankAccountUseCase({required this.repository});

  final ProfileRepository repository;

  Future<void> call({required CreateAccountState state}) async {
    final domain = CreateAccount.toDomain(state: state);
    return repository.createAccount(account: domain);
  }
}
