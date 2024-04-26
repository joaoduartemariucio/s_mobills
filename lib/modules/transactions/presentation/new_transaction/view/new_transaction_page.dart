import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/transactions/domain/model/transaction_type.dart';
import 'package:s_mobills/modules/transactions/module.dart';
import 'package:s_mobills/modules/transactions/presentation/new_transaction/cubit/new_transaction_cubit.dart';
import 'package:s_mobills/ui/ui.dart';

class NewTransactionPage extends StatelessWidget {
  const NewTransactionPage({
    required this.transactionType,
    super.key,
  });

  final TransactionType transactionType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewTransactionCubit()
        ..setupTransactionType(
          transactionType: transactionType,
        ),
      child: const NewTransactionView(),
    );
  }
}

class NewTransactionView extends StatelessWidget {
  const NewTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTransactionCubit, NewTransactionState>(
      builder: (context, state) {
        return Scaffold(
          appBar: SMobillsAppBar(
            title: state.transactionType == TransactionType.expense
                ? context.l10n.newExpenseTransaction
                : context.l10n.newIncomeTransaction,
            backgroundColor: context.colorScheme.background,
            elevation: 0,
          ),
          backgroundColor: context.colorScheme.background,
          body: Column(
            children: [
              Text(
                context.l10n.transactionInstructions,
                style: SMobillsTextStyles.caption,
              ),
              SMobillsSpacing.md,
              GestureDetector(
                onTap: () =>
                    context.read<NewTransactionCubit>().editTransactionValue,
                child: TransactionValue(
                  value: state.transactionValue,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
