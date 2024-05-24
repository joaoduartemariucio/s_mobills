import 'package:flutter/material.dart';
import 'package:s_mobills/ui/ui.dart';

class HomeEmptyState extends StatelessWidget {
  const HomeEmptyState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SMobillsSpacing.sm,
          const Text(
            'Você não possui movimentações',
            style: SMobillsTextStyles.body1,
          ),
          SMobillsSpacing.md,
          Text(
            'Assim que gastar aparecera aqui',
            style: SMobillsTextStyles.subtitle2.copyWith(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.75),
            ),
          ),
          SMobillsSpacing.sm,
        ],
      ),
    );
  }
}
