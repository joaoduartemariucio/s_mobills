import 'package:flutter/material.dart';
import 'package:s_mobills/l10n/l10n.dart';

class SMobillsDateFormatter {
  /// Formats a [DateTime] object into a human-readable date representation.
  ///
  /// If the provided date is the same as the current date, returns 'Today'.
  /// If the provided date is the day before the current date, returns 'Yesterday'.
  /// Otherwise, returns a string containing the weekday followed by the day of the month.
  ///
  /// Example usage:
  /// ```dart
  /// DateTime date = DateTime.now();
  /// print(formatDate(date)); // Output: Today or Yesterday or Weekday, Day
  /// ```
  static String formatDate({
    required BuildContext context,
    required DateTime date,
  }) {
    final today = DateTime.now();
    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return context.l10n.today;
    } else if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day - 1) {
      return context.l10n.yesterday;
    } else {
      return '${weekday(context, date.weekday)}, ${date.day}/${date.month}/${date.year}';
    }
  }

  /// Converts a numeric representation of a day of the week into its corresponding name.
  ///
  /// The function takes an integer representing the day of the week (1 for Sunday, 2 for Monday, etc.)
  /// and returns the corresponding name of the day.
  ///
  /// Example usage:
  /// ```dart
  /// int dayNumber = 3;
  /// print(weekday(dayNumber)); // Output: Tuesday
  /// ```
  static String weekday(BuildContext context, int dayNumber) {
    switch (dayNumber) {
      case 1:
        return context.l10n.sunday;
      case 2:
        return context.l10n.monday;
      case 3:
        return context.l10n.tuesday;
      case 4:
        return context.l10n.wednesday;
      case 5:
        return context.l10n.thursday;
      case 6:
        return context.l10n.friday;
      case 7:
        return context.l10n.saturday;
      default:
        return '';
    }
  }
}
