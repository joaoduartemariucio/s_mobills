import 'package:flutter/material.dart';
import 'package:s_mobills/ui/ui.dart';

class SMobillsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SMobillsAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.customPreferredSize,
  });

  final String title;
  final PreferredSizeWidget? bottom;
  final Size? customPreferredSize;

  @override
  Size get preferredSize =>
      customPreferredSize ?? const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: SMobillsTextStyles.h6.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      bottom: bottom,
      elevation: 8,
    );
  }
}
