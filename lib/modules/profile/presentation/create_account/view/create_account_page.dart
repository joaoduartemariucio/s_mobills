import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/profile/module.dart';
import 'package:s_mobills/ui/ui.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateAccountCubit(
        createNewBankAccountUseCase: GetIt.I<CreateNewBankAccountUseCase>(),
      ),
      child: const CreateAccountView(),
    );
  }
}

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountCubit, CreateAccountState>(
      builder: (context, state) {
        return Scaffold(
          appBar: SMobillsAppBar(
            title: context.l10n.createAccount,
          ),
          body: Column(
            children: [
              SMobillsSpacing.md,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Text(
                    context.l10n.createAccountDetails,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SMobillsTextField(
                controller: context
                    .read<CreateAccountCubit>()
                    .accountNameEditController,
                hintText: context.l10n.name,
              ),
              SMobillsSpacing.md,
              SMobillsTextField(
                controller: context
                    .read<CreateAccountCubit>()
                    .accountBalanceEditController,
                hintText: context.l10n.currentBalance,
                keyboardType: TextInputType.number,
              ),
              SMobillsSpacing.lg,
              SMobillsButton(
                title: context.l10n.save,
                onPressed: context.read<CreateAccountCubit>().saveAccount,
                isLoading: state.isLoading,
              ),
            ],
          ),
        );
      },
    );
  }
}
