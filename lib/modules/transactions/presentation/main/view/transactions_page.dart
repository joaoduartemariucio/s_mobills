// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/transactions/domain/model/transaction.dart';
import 'package:s_mobills/modules/transactions/domain/model/transaction_type.dart';
import 'package:s_mobills/modules/transactions/presentation/main/cubit/transactions_cubit.dart';
import 'package:s_mobills/modules/transactions/presentation/widgets/widgets.dart';
import 'package:s_mobills/ui/ui.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionsCubit(),
      child: TransactionsView(),
    );
  }
}

class TransactionsView extends StatelessWidget {
  TransactionsView({super.key});

  final transactions = Transaction.generateRandomTransactions(5);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsCubit, TransactionsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: SMobillsAppBar(
            title: context.l10n.transactions,
            elevation: 8,
          ),
          backgroundColor: context.colorScheme.background,
          body: GroupedListView<dynamic, String>(
            elements: transactions,
            groupBy: (element) {
              return element.dateOfTransaction.toString();
            },
            groupComparator: (value1, value2) => value2.compareTo(value1),
            groupSeparatorBuilder: (String value) {
              final date = DateTime.parse(value);
              final title = SMobillsDateFormatter.formatDate(
                context: context,
                date: date,
              );

              return TransactionSectionTitle(title: title);
            },
            itemBuilder: (_, element) {
              final name = element.name as String;
              final description = element.description as String;
              final value = element.value as double;
              final isExpense = element.isExpense as bool;

              return TransactionItem(
                isExpense: isExpense,
                name: name,
                description: description,
                value: value,
              );
            },
          ),
          floatingActionButtonLocation: ExpandableFab.location,
          floatingActionButton: ExpandableFab(
            openButtonBuilder: RotateFloatingActionButtonBuilder(
              child: const Icon(Icons.add),
              shape: const CircleBorder(),
            ),
            closeButtonBuilder: RotateFloatingActionButtonBuilder(
              child: const Icon(Icons.close),
              shape: const CircleBorder(),
            ),
            children: [
              FloatingActionButton(
                backgroundColor: Colors.green.shade700,
                onPressed: () => context
                    .read<TransactionsCubit>()
                    .addTransaction(type: TransactionType.income),
                shape: const CircleBorder(),
                child: const Icon(Icons.north_outlined),
              ),
              FloatingActionButton(
                backgroundColor: context.colorScheme.errorContainer,
                onPressed: () => context
                    .read<TransactionsCubit>()
                    .addTransaction(type: TransactionType.expense),
                shape: const CircleBorder(),
                child: const Icon(Icons.south_outlined),
              ),
            ],
          ),
        );
      },
    );
  }
}
