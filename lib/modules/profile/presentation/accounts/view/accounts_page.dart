import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/modules.dart';
import 'package:s_mobills/ui/ui.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AccountsCubit(),
      child: const AccountsView(),
    );
  }
}

class AccountsView extends StatelessWidget {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsCubit, AccountsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: SMobillsAppBar(
            title: context.l10n.yourAccounts,
          ),
          body: Column(
            children: [],
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: null,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            onPressed: context.read<AccountsCubit>().createAccount,
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
