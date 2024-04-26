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
  });

  final String title;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final Size? customPreferredSize;
  final Color? backgroundColor;

  @override
  Size get preferredSize =>
      customPreferredSize ?? const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor ?? context.colorScheme.primary,
      title: Text(
        title,
        style: SMobillsTextStyles.h6.copyWith(
          fontWeight: FontWeight.w700,
          color: context.colorScheme.onPrimary,
        ),
      ),
      bottom: bottom,
      elevation: elevation,
      shadowColor: context.colorScheme.shadow,
    );
  }
}
