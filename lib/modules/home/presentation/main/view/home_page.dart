// ignore_for_file: avoid_dynamic_calls
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/home/presentation/widgets/home_header.dart';
import 'package:s_mobills/modules/home/presentation/widgets/month_balance.dart';
import 'package:s_mobills/modules/home/presentation/widgets/spending_category.dart';
import 'package:s_mobills/modules/home/presentation/widgets/spending_frequency.dart';
import 'package:s_mobills/modules/modules.dart';
import 'package:s_mobills/ui/ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        getTransactionsPeriodUseCase: GetIt.I<GetTransactionsPeriodUseCase>(),
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
            title: context.l10n.home,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const HomeHeader(
                  totalIncome: r'R$ 500,00',
                  totalExpanse: r'R$ 500,00',
                  balance: r'R$ 0,00',
                ),
                const MonthBalance(
                  totalIncome: r'R$ 500,00',
                  totalExpanse: r'R$ 500,00',
                  balance: r'R$ 0,00',
                  balancePercent: '19%',
                  spentTooMuch: true,
                ),
                SpendingCategory(days: state.lastSevenDaysExpense),
                SpendingFrequency(
                  days: state.lastSevenDaysExpense,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
