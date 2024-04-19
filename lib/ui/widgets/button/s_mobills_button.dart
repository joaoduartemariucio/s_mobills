import 'package:flutter/material.dart';
import 'package:s_mobills/ui/utils/s_mobills_styles.dart';

class SMobillsButton extends StatelessWidget {
  const SMobillsButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200, 50),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: SMobillsTextStyles.button.copyWith(
          fontSize: FontSize.subtitle1,
        ),
      ),
    );
  }
}
