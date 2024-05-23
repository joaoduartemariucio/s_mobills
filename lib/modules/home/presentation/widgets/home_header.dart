import 'package:flutter/material.dart';
import 'package:s_mobills/ui/ui.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.balance,
    required this.totalExpanse,
    required this.totalIncome,
  });

  final String balance;
  final String totalExpanse;
  final String totalIncome;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        color: context.colorScheme.primary,
      ),
      child: Column(
        children: [
          Text(
            'Saldo em contas',
            style: SMobillsTextStyles.subtitle2.copyWith(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.75),
            ),
          ),
          SMobillsSpacing.sm,
          Text(
            balance,
            style: SMobillsTextStyles.h4.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          SMobillsSpacing.md,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeBalanceItem(
                  title: 'Receitas',
                  icon: Icons.north_outlined,
                  color: Colors.green,
                  value: totalIncome,
                ),
                HomeBalanceItem(
                  title: 'Despesas',
                  icon: Icons.south_outlined,
                  color: Colors.red,
                  value: totalExpanse,
                ),
              ],
            ),
          ),
          SMobillsSpacing.md,
        ],
      ),
    );
  }
}

class HomeBalanceItem extends StatelessWidget {
  const HomeBalanceItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.value,
    super.key,
  });

  final String title;
  final IconData icon;
  final Color color;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        SMobillsInline.md,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: SMobillsTextStyles.body1.copyWith(
                color:
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.75),
              ),
            ),
            Text(
              value,
              style: SMobillsTextStyles.subtitle1.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onPrimary),
              softWrap: true,
            ),
          ],
        ),
      ],
    );
  }
}
