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
        getTransactionsPeriodUseCase: GetIt.I<GetTransactionsPeriodUseCase>(),
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
            customPreferredSize: const Size.fromHeight(100),
            bottom: TransactionAppBarBottom(
              title: DateHelper.formatterBy(state.year, state.month),
              onTapBack: context.read<TransactionsCubit>().previousMonth,
              onTapNext: context.read<TransactionsCubit>().nextMonth,
            ),
          ),
          backgroundColor: context.colorScheme.background,
          body: state.transactions.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'lib/resources/icons/empty_transactions.png',
                          width: 100,
                        ),
                      ),
                      SMobillsSpacing.md,
                      const Text(
                        'Sem movimentações',
                        style: SMobillsTextStyles.h4,
                      ),
                      SMobillsSpacing.md,
                      Text(
                        'Você ainda não registrou nenhuma transação neste mês',
                        textAlign: TextAlign.center,
                        style: SMobillsTextStyles.overline.copyWith(
                          fontSize: 16,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.75),
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                )
              : GroupedListView<dynamic, String>(
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
                    final transaction = element as Transaction;
                    return InkWell(
                      onTap: () => context
                          .read<TransactionsCubit>()
                          .editTransaction(transaction: transaction),
                      child: TransactionItem(
                        isExpense: transaction.type == TransactionType.expense,
                        isDone: transaction.done,
                        name: transaction.category.displayName,
                        description: transaction.description,
                        value: transaction.value.formatted,
                      ),
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
