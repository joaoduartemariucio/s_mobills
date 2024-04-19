// ignore_for_file: use_raw_strings

import 'package:intl/intl.dart';

class SMobillsCurrencyFormatter {
  static String formatCurrency(double amount) {
    // Create a NumberFormat instance for currency formatting with Brazilian locale
    final currencyFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    // Format the amount as currency
    return currencyFormat.format(amount);
  }
}
