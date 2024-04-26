import 'package:flutter/material.dart';
import 'package:s_mobills/modules/transactions/presentation/widgets/widgets.dart';
import 'package:s_mobills/ui/ui.dart';

class TransactionAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const TransactionAppBarBottom({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(200);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          MonthlySelect(
            title: 'Abril',
            onTapBack: () {},
            onTapNext: () {},
          ),
          const Column(
            children: [
              CurrentBalance(
                currentBalance: "R\$ 25.000,00",
                monthlyBalance: "R\$ 25.000,00",
              ),
              SMobillsSpacing.md,
            ],
          ),
        ],
      ),
    );
  }
}
