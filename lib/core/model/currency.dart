import 'package:intl/intl.dart';

class Currency {
  Currency({required this.value});

  final double value;

  final _moneyFormatter = NumberFormat.currency(
    locale: 'pt_BR',
    name: 'BRL',
    symbol: r'R$',
    decimalDigits: 2,
  );

  String get formatted {
    return _moneyFormatter.format(value);
  }
}
