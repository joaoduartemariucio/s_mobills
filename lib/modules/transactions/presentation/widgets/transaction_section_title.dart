import 'package:flutter/material.dart';
import 'package:s_mobills/ui/ui.dart';

class TransactionSectionTitle extends StatelessWidget {
  const TransactionSectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: SMobillsTextStyles.body1.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
