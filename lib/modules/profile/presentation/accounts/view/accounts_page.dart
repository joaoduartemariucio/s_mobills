import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/modules.dart';
import 'package:s_mobills/ui/ui.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key, this.isNewTransaction = false});

  final bool isNewTransaction;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AccountsCubit(
        getUserBankAccountsUseCase: GetIt.I<GetUserBankAccountsUseCase>(),
      )..setIsNewTransaction(
          isNewTransaction,
        ),
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
          body: state.isEmptyAccounts
              ? const AccountViewEmpty()
              : ListView.builder(
                  itemCount: state.accounts.length,
                  itemBuilder: (context, index) {
                    final item = state.accounts[index];
                    return GestureDetector(
                      onTap: () {
                        if (state.isNewTransaction) {
                          context.read<AccountsCubit>().onSelectedAccount(item);
                        } else {
                          context
                              .read<AccountsCubit>()
                              .editAccount(account: item);
                        }
                      },
                      child: AccountBankItem(item: item),
                    );
                  },
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

class AccountBankItem extends StatelessWidget {
  const AccountBankItem({
    super.key,
    required this.item,
  });

  final BankAccount item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: SMobillsTextStyles.body1.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SMobillsSpacing.md,
            Text(
              'Saldo: ${item.balance.formatted}',
              style: SMobillsTextStyles.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}

class AccountViewEmpty extends StatelessWidget {
  const AccountViewEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'lib/resources/icons/empty_bank_accounts.png',
              width: 200,
            ),
          ),
          SMobillsSpacing.md,
          Text(
            context.l10n.emptyBankAccounts,
            style: SMobillsTextStyles.h4,
          ),
          SMobillsSpacing.md,
          Text(
            context.l10n.emptyBankAccountsDetails,
            textAlign: TextAlign.center,
            style: SMobillsTextStyles.overline.copyWith(
              fontSize: 16,
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.75),
            ),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
