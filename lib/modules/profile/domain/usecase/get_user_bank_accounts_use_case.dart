import 'package:s_mobills/modules/modules.dart';

class GetUserBankAccountsUseCase {
  GetUserBankAccountsUseCase({required this.repository});
  final ProfileRepository repository;

  Future<List<BankAccount>> call() async {
    return repository.accounts();
  }
}
