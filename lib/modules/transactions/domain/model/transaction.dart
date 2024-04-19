import 'dart:math';

class Transaction {
  const Transaction({
    required this.name,
    required this.description,
    required this.value,
    required this.isExpense,
    required this.dateOfTransaction,
  });

  final String name;
  final String description;
  final double value;
  final bool isExpense;
  final DateTime dateOfTransaction;

  static List<Transaction> generateRandomTransactions(int count) {
    final transactions = <Transaction>[];
    final random = Random();

    for (var i = 0; i < count; i++) {
      // Generate random name and description
      final name = 'Transaction $i';
      final description = 'Description $i';

      // Generate random value between 1 and 100
      final value = random.nextDouble() * 100;

      // Generate random isExpense value (true or false)
      final isExpense = random.nextBool();

      // Generate random date between 2020 and 2025
      final dateOfTransaction = DateTime(
        2024,
        4,
        1 + random.nextInt(18),
      );

      // Create Transaction object and add it to the list
      transactions.add(
        Transaction(
          name: name,
          description: description,
          value: value,
          isExpense: isExpense,
          dateOfTransaction: dateOfTransaction,
        ),
      );
    }

    return transactions;
  }
}
