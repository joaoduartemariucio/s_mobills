import 'package:flutter/material.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/ui/ui.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60),
      height: context.mediaQuery.size.height * 0.75,
      width: context.mediaQuery.size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        color: context.colorScheme.primary,
      ),
      child: Text(
        context.l10n.appName,
        textAlign: TextAlign.center,
        style: SMobillsTextStyles.h3.copyWith(
          fontWeight: FontWeight.bold,
          color: context.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
