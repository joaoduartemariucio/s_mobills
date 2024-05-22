import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get_it/get_it.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:s_mobills/core/core.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/transactions/module.dart';
import 'package:s_mobills/ui/ui.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionsCubit(
        getAllUserTransactionsUseCase: GetIt.I<GetAllUserTransactionsUseCase>(),
      ),
      child: const TransactionsView(),
    );
  }
}

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

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
            elements: state.transactions,
            groupBy: (element) {
              final date = element.date as DateTime;
              final inputDateFormat = DateFormat('dd/MM/yyyy');
              final formattedDate = inputDateFormat.format(date);
              return formattedDate;
            },
            groupComparator: (value1, value2) => value2.compareTo(value1),
            groupSeparatorBuilder: (String value) {
              final inputDateFormat = DateFormat('dd/MM/yyyy');
              final date = inputDateFormat.parse(value);
              final title = SMobillsDateFormatter.formatDate(
                context: context,
                date: date,
              );

              return TransactionSectionTitle(title: title);
            },
            itemBuilder: (_, element) {
              final value = element.value as Currency;
              final isDone = element.done as bool;
              final description = element.description as String;
              final category = element.category as CategoryType;
              final type = element.type as TransactionType;

              return TransactionItem(
                isExpense: type == TransactionType.expense,
                isDone: isDone,
                name: category.displayName,
                description: description,
                value: value.formatted,
              );
            },
          ),
          floatingActionButtonLocation: ExpandableFab.location,
          floatingActionButton: ExpandableFab(
            key: context.read<TransactionsCubit>().floatingButtonKey,
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
                heroTag: null,
                backgroundColor: Colors.green.shade700,
                onPressed: () => context
                    .read<TransactionsCubit>()
                    .addTransaction(type: TransactionType.income),
                shape: const CircleBorder(),
                child: const Icon(Icons.north_outlined),
              ),
              FloatingActionButton(
                heroTag: null,
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
