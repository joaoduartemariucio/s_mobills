import 'package:s_mobills/core/model/currency.dart';
import 'package:s_mobills/modules/modules.dart';
import 'package:s_mobills/modules/profile/module.dart';

class UpdateBankAccountUseCase {
  UpdateBankAccountUseCase({required this.repository});

  final ProfileRepository repository;

  Future<void> call({required EditAccountState state}) {
    final account = BankAccount(
      id: state.id,
      name: state.name,
      balance: Currency(
        value: state.balance,
      ),
    );

    return repository.updateAccount(account: account);
  }
}
