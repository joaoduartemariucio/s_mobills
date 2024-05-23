import 'package:flutter/material.dart';
import 'package:s_mobills/modules/transactions/presentation/widgets/widgets.dart';

class TransactionAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const TransactionAppBarBottom({
    super.key,
    required this.title,
    required this.onTapBack,
    required this.onTapNext,
  });

  final String title;
  final VoidCallback onTapNext;
  final VoidCallback onTapBack;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          MonthlySelect(
            title: title,
            onTapBack: onTapBack.call,
            onTapNext: onTapNext.call,
          ),
        ],
      ),
    );
  }
}
