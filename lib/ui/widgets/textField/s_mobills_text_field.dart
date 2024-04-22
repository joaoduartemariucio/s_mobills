// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:s_mobills/ui/utils/s_mobills_styles.dart';

class SMobillsTextField extends StatelessWidget {
  const SMobillsTextField({
    required this.hintText,
    super.key,
    this.onChanged,
    this.controller,
    this.obscureText,
  });

  final TextEditingController? controller;
  final String hintText;
  final bool? obscureText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        style: SMobillsTextStyles.body1,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: SMobillsTextStyles.subtitle1,
        ),
      ),
    );
  }
}
