import 'package:flutter/material.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/ui/ui.dart';

class TransactionValue extends StatelessWidget {
  const TransactionValue({
    required this.value,
    super.key,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.transactionValue,
            style: SMobillsTextStyles.subtitle2,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            value,
            style: SMobillsTextStyles.h4.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
