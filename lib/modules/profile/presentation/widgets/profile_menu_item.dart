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
                size: 36,
                color: context.colorScheme.onBackground,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: SMobillsTextStyles.h6.copyWith(
                  color: context.colorScheme.onBackground,
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
