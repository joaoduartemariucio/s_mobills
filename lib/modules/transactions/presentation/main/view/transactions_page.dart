// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/transactions/domain/model/transaction.dart';
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
  final transactions = Transaction.generateRandomTransactions(100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SMobillsAppBar(
        title: context.l10n.transactions,
        bottom: const TransactionAppBarBottom(),
        customPreferredSize: Size.fromHeight(
          context.mediaQuery.size.height * 0.18,
        ),
      ),
      backgroundColor: context.isDarkMode ? Colors.black : Colors.white,
      body: GroupedListView<dynamic, String>(
        elements: transactions,
        groupBy: (element) {
          return element.dateOfTransaction.toString();
        },
        groupComparator: (value1, value2) => value2.compareTo(value1),
        groupSeparatorBuilder: (String value) {
          final date = DateTime.parse(value);
          final title =
              SMobillsDateFormatter.formatDate(context: context, date: date);

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
    );
  }
}

class TransactionAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const TransactionAppBarBottom({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(200);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          MonthlySelect(
            title: 'Abril',
            onTapBack: () {},
            onTapNext: () {},
          ),
          const Column(
            children: [
              CurrentBalance(
                currentBalance: "R\$ 25.000,00",
                monthlyBalance: "R\$ 25.000,00",
              ),
              SMobillsSpacing.md,
            ],
          ),
        ],
      ),
    );
  }
}
