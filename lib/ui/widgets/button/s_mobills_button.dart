// ignore_for_file: always_put_required_named_parameters_first
import 'package:flutter/material.dart';
import 'package:s_mobills/ui/utils/s_mobills_styles.dart';

class SMobillsButton extends StatelessWidget {
  const SMobillsButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading,
    this.textStyle,
    this.buttonStyle,
  });

  final String title;
  final VoidCallback onPressed;
  final bool? isLoading;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle ??
          ElevatedButton.styleFrom(
            fixedSize: Size(
              (isLoading ?? false) ? 85 : 200,
              (isLoading ?? false) ? 60 : 50,
            ),
            backgroundColor: context.colorScheme.primaryContainer,
          ),
      onPressed: (isLoading ?? false) ? null : onPressed.call,
      child: (isLoading ?? false)
          ? CircularProgressIndicator(
              color: context.colorScheme.primaryContainer,
              backgroundColor: context.colorScheme.onPrimaryContainer,
            )
          : Text(
              title,
              style: textStyle ??
                  SMobillsTextStyles.button.copyWith(
                    fontSize: FontSize.subtitle1,
                    color: context.colorScheme.onPrimaryContainer,
                  ),
            ),
    );
  }
}
