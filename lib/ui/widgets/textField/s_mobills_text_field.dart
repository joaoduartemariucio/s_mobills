// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:s_mobills/ui/utils/s_mobills_styles.dart';

class SMobillsTextField extends StatelessWidget {
  const SMobillsTextField({
    required this.hintText,
    super.key,
    this.onChanged,
    this.controller,
  });

  final TextEditingController? controller;
  final String hintText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: SMobillsTextStyles.body1,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: SMobillsTextStyles.subtitle1,
        ),
      ),
    );
  }
}
