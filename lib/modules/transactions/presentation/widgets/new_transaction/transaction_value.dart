import 'package:currency_textfield/currency_textfield.dart';
import 'package:flutter/material.dart';
import 'package:s_mobills/l10n/l10n.dart';
import 'package:s_mobills/ui/ui.dart';

class TransactionValue extends StatelessWidget {
  const TransactionValue({
    required this.controller,
    super.key,
  });

  final CurrencyTextFieldController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.transactionValue,
            style: SMobillsTextStyles.subtitle2.copyWith(
              color: context.colorScheme.onPrimary,
            ),
          ),
          TextField(
            controller: controller,
            onTapOutside: (event) {
              final currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: r"R$ 0,00",
              hintStyle: SMobillsTextStyles.h4.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onPrimary.withOpacity(0.75),
              ),
            ),
            style: SMobillsTextStyles.h4.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.onPrimary,
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
