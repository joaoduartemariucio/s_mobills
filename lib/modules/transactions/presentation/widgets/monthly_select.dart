import 'package:flutter/material.dart';
import 'package:s_mobills/ui/ui.dart';

class MonthlySelect extends StatelessWidget {
  const MonthlySelect({
    super.key,
    required this.title,
    required this.onTapBack,
    required this.onTapNext,
  });

  final String title;
  final VoidCallback onTapNext;
  final VoidCallback onTapBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTapBack.call,
            child: const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.white,
              size: 32,
            ),
          ),
          SMobillsInline.custom(100),
          Text(
            title,
            style: SMobillsTextStyles.h6.copyWith(
              color: context.isDarkMode ? Colors.blue : Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SMobillsInline.custom(100),
          GestureDetector(
            onTap: onTapNext,
            child: const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
