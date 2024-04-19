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
      backgroundColor: context.isDarkMode ? Colors.black : Colors.blue,
      centerTitle: true,
      title: Text(
        title,
        style: SMobillsTextStyles.h6.copyWith(
          color: context.isDarkMode ? Colors.blue : Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
      bottom: bottom,
      elevation: 8,
      shadowColor: Colors.black,
    );
  }
}
