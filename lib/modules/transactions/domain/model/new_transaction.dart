import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/modules/transactions/module.dart';

class NewTransaction {
  NewTransaction({
    required this.bankAccountId,
    required this.value,
    required this.description,
    required this.date,
    required this.done,
    required this.transactionType,
    required this.categoryType,
  });

  factory NewTransaction.toDomain({required TransactionState state}) {
    return NewTransaction(
      bankAccountId: state.bankAccountId,
      value: state.transactionValue,
      description: state.description,
      date: state.selectedDate ?? DateTime.now(),
      done: state.done,
      transactionType: state.transactionType,
      categoryType: state.categoryType,
    );
  }

  final int bankAccountId;
  final String description;
  final double value;
  final DateTime date;
  final bool done;
  final TransactionType transactionType;
  final CategoryType categoryType;
}
