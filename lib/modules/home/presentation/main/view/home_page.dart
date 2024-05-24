import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:s_mobills/core/helpers/date_helper.dart';
import 'package:s_mobills/modules/home/presentation/widgets/home_header.dart';
import 'package:s_mobills/modules/home/presentation/widgets/month_balance.dart';
import 'package:s_mobills/modules/home/presentation/widgets/spending_category.dart';
import 'package:s_mobills/modules/home/presentation/widgets/spending_frequency.dart';
import 'package:s_mobills/modules/modules.dart';
import 'package:s_mobills/ui/ui.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        getTransactionsPeriodUseCase: GetIt.I<GetTransactionsPeriodUseCase>(),
        getUserBankAccountsUseCase: GetIt.I<GetUserBankAccountsUseCase>(),
      ),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: SMobillsAppBar(
            title: '',
            customPreferredSize: const Size.fromHeight(75),
            bottom: TransactionAppBarBottom(
              title: DateHelper.formatterBy(state.year, state.month),
              onTapBack: context.read<HomeCubit>().previousMonth,
              onTapNext: context.read<HomeCubit>().nextMonth,
            ),
          ),
          body: Skeletonizer(
            enabled: state.isLoading,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeHeader(
                    totalIncome: state.totalIncome.formatted,
                    totalExpanse: state.totalExpense.formatted,
                    balance: state.balanceInAccounts.formatted,
                  ),
                  SMobillsSpacing.md,
                  MonthBalance(
                    totalIncome: state.totalIncome.formatted,
                    totalExpanse: state.totalExpense.formatted,
                    balance: state.balance.formatted,
                    balancePercent:
                        '${state.economyPercent.isNaN ? 0.00 : state.economyPercent.toStringAsFixed(2)}%',
                    spentTooMuch: state.spendingTooMuch,
                  ),
                  SMobillsSpacing.md,
                  SpendingCategory(
                    categoriesDataSource: state.categoriesDataSource,
                  ),
                  SMobillsSpacing.md,
                  SpendingFrequency(
                    days: state.lastSevenDaysExpense,
                    isSpendingEmpty: state.lastSevenDaysExpenseEmpty,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
