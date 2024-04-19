import 'package:flutter/material.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/modules/transactions/presentation/widgets/balance_item.dart';
import 'package:s_mobills/ui/ui.dart';

class CurrentBalance extends StatelessWidget {
  const CurrentBalance({
    super.key,
    required this.currentBalance,
    required this.monthlyBalance,
  });

  final String currentBalance;
  final String monthlyBalance;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BalanceItem(
          icon: Icons.balance_outlined,
          title: context.l10n.currentBalance,
          value: currentBalance,
        ),
        const SMobillsDivider(isVertical: true),
        BalanceItem(
          icon: Icons.account_balance_wallet_outlined,
          title: context.l10n.monthlyBalance,
          value: monthlyBalance,
        ),
      ],
    );
  }
}
