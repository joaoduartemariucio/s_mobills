import 'package:flutter/material.dart';
import 'package:s_mobills/ui/utils/s_mobills_styles.dart';

class SMobillsTextField extends StatelessWidget {
  const SMobillsTextField({
    super.key,
    required this.hintText,
    this.controller,
  });

  final TextEditingController? controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: controller,
        style: SMobillsTextStyles.body1.copyWith(
          color: context.isDarkMode ? Colors.white : Colors.black,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: SMobillsTextStyles.subtitle1.copyWith(
            color: Colors.grey,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
