import 'package:intl/intl.dart';

class Currency {
  const Currency({required this.value});

  final double value;

  String get formatted {
    return _moneyFormatter.format(value);
  }
}

final NumberFormat _moneyFormatter = NumberFormat.currency(
  locale: 'pt_BR',
  name: 'BRL',
  symbol: r'R$',
  decimalDigits: 2,
);
