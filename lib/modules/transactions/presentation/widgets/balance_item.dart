import 'package:flutter/material.dart';
import 'package:s_mobills/ui/ui.dart';

class BalanceItem extends StatelessWidget {
  const BalanceItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 32,
        ),
        SMobillsInline.md,
        Column(
          children: [
            Text(
              title,
              style: SMobillsTextStyles.caption.copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              value,
              style: SMobillsTextStyles.h6.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
