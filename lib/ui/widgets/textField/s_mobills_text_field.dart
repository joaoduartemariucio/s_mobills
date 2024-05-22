import 'package:flutter/material.dart';
import 'package:s_mobills/ui/utils/s_mobills_styles.dart';

class SMobillsTextField extends StatelessWidget {
  const SMobillsTextField({
    super.key,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.obscureText,
    this.readOnly,
  });

  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: SMobillsTextStyles.subtitle1,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
        cursorColor: Theme.of(context).colorScheme.inversePrimary,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        style: SMobillsTextStyles.body1,
        readOnly: readOnly ?? false,
        onTapOutside: (event) {
          final currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
      ),
    );
  }
}
