import 'package:flutter/material.dart';
import 'package:s_mobills/ui/ui.dart';

class MonthBalance extends StatelessWidget {
  const MonthBalance({
    super.key,
    required this.totalExpanse,
    required this.totalIncome,
    required this.balance,
    required this.balancePercent,
    required this.spentTooMuch,
  });

  final String totalExpanse;
  final String totalIncome;
  final String balance;
  final String balancePercent;
  final bool spentTooMuch;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Balanço mensal',
            style: SMobillsTextStyles.subtitle1.copyWith(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.75),
              fontWeight: FontWeight.w600,
            ),
          ),
          SMobillsSpacing.sm,
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Receitas',
                        style: SMobillsTextStyles.body1.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      Text(
                        totalIncome,
                        style: SMobillsTextStyles.body2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SMobillsSpacing.sm,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Despesas',
                        style: SMobillsTextStyles.body1.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      Text(
                        totalExpanse,
                        style: SMobillsTextStyles.body2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SMobillsSpacing.xlg,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Balanço',
                        style: SMobillsTextStyles.body1.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      Text(
                        balance,
                        style: SMobillsTextStyles.body2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                  SMobillsSpacing.md,
                  const Text('Sua economia este mês é de'),
                  SMobillsSpacing.sm,
                  Text(balance),
                  SMobillsSpacing.md,
                  Text('Você economizou $balancePercent dos seus ganhos'),
                  SMobillsSpacing.md,
                  if (spentTooMuch)
                    Text(
                      'Você está gastando demais registre todas suas despesas e se controle',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:
                            context.colorScheme.onBackground.withOpacity(0.75),
                      ),
                    )
                  else
                    Text(
                      'É parece que você está no controle continue assim',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:
                            context.colorScheme.onBackground.withOpacity(0.75),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
