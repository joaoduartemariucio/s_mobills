import 'package:flutter/material.dart';
import 'package:s_mobills/ui/ui.dart';

class SMobillsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SMobillsAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.elevation,
    this.customPreferredSize,
    this.backgroundColor,
    this.foregroundColor,
  });

  final String title;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final Size? customPreferredSize;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Size get preferredSize =>
      customPreferredSize ?? const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor ?? context.colorScheme.primary,
      foregroundColor: foregroundColor ?? context.colorScheme.onPrimary,
      title: Text(
        title,
        style: SMobillsTextStyles.h6.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      bottom: bottom,
      elevation: elevation,
      shadowColor: context.colorScheme.shadow,
    );
  }
}
