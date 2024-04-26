import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/transactions/presentation/new_transaction/cubit/new_transaction_cubit.dart';
import 'package:s_mobills/ui/ui.dart';

class NewTransactionPage extends StatelessWidget {
  const NewTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewTransactionCubit(),
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
            title: context.l10n.transactions,
            elevation: 8,
          ),
          backgroundColor: context.colorScheme.background,
          body: const Column(
            children: [Text('nova conta ou novo bonus')],
          ),
        );
      },
    );
  }
}
