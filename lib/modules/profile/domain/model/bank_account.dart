import 'package:s_mobills/core/model/currency.dart';
import 'package:s_mobills/modules/modules.dart';

class BankAccount {
  BankAccount({
    required this.id,
    required this.name,
    required this.balance,
  });

  factory BankAccount.toDomain({required BankAccountResponse response}) {
    return BankAccount(
      id: response.id,
      name: response.name,
      balance: Currency(value: response.balance),
    );
  }

  final int id;
  final String name;
  final Currency balance;
}
