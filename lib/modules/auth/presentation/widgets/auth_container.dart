import 'package:flutter/material.dart';
import 'package:s_mobills/ui/ui.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: context.mediaQuery.size.height * 0.15,
        horizontal: context.mediaQuery.size.width * 0.08,
      ),
      padding: const EdgeInsets.only(top: 16),
      height: context.mediaQuery.size.height * 0.70,
      width: context.mediaQuery.size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
        color: context.colorScheme.background,
      ),
      child: child,
    );
  }
}
