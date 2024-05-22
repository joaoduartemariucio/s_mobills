import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/transactions/module.dart';

class Transaction {
  const Transaction({
    required this.id,
    required this.description,
    required this.value,
    required this.accountId,
    required this.date,
    required this.done,
    required this.type,
    required this.category,
  });

  factory Transaction.toDomain(TransactionResponse response) {
    return Transaction(
      id: response.id,
      description: response.description,
      value: Currency(value: response.value),
      accountId: response.accountId,
      date: response.date,
      done: response.done,
      type: response.type,
      category: response.category,
    );
  }

  final int id;
  final String description;
  final Currency value;
  final int accountId;
  final DateTime date;
  final bool done;
  final TransactionType type;
  final CategoryType category;
}
