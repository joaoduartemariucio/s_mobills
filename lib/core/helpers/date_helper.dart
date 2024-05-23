import 'package:intl/intl.dart';

class DateHelper {
  static DateTime firstDayMonth(int year, int month) {
    return DateTime(year, month);
  }

  static DateTime lastDayMonth(int year, int month) {
    return DateTime(year, month + 1, 0, 23, 59, 59);
  }

  static String formatterBy(int year, int month) {
    final date = DateTime(year, month + 1, 0, 23, 59, 59);
    final inputFormat = DateFormat('MMMM', 'pt_BR');
    return inputFormat.format(date);
  }
}
