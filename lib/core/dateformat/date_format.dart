import 'package:intl/intl.dart';

class DateFormatting {
  static String thumbnailDate(DateTime date) {
    final today = DateTime.now();
    // 10:55 AM
    if (date.day == today.day &&
        date.month == today.month &&
        date.year == today.year) {
      return DateFormat.jm().format(date);
    }
    // Yesterday 4:09 PM
    else if (today.difference(date).inDays < 2) {
      return 'Yesterday ${DateFormat('h:mm a').format(date)}';
    }
    // Mon 7:56 PM
    else if (today.subtract(const Duration(days: 7)).isBefore(date)) {
      return DateFormat('E h:mm a').format(date);
    }
    // January 8, 2023
    else {
      return DateFormat('MMMM d, yyyy').format(date);
    }
  }

  static String notePageDate(DateTime date) {
    final today = DateTime.now();
    // February 6 7:57 PM
    if (date.year == today.year) {
      return DateFormat('MMMM d h:mm a').format(date);
    }
    // November 14, 2022 12:26 AM
    else {
      return DateFormat('MMMM d, yyyy h:mm a').format(date);
    }
  }
}
