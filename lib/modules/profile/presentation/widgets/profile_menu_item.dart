import 'package:flutter/material.dart';
import 'package:s_mobills/ui/ui.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap.call,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Icon(
                icon,
                color: context.isDarkMode ? Colors.white : Colors.black,
                size: 36,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: SMobillsTextStyles.h6.copyWith(
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            height: 0.25,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
