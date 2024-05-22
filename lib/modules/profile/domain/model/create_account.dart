import 'package:s_mobills/modules/profile/module.dart';

class CreateAccount {
  CreateAccount({required this.name, required this.balance});

  factory CreateAccount.toDomain({required CreateAccountState state}) {
    return CreateAccount(
      name: state.name,
      balance: state.balance,
    );
  }

  final String name;
  final double balance;
}
