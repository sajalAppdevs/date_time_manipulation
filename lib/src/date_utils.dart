import 'package:intl/intl.dart';

class DateUtilsHelper {
  static String formatDate(DateTime date, {String pattern = 'yMMMMd'}) {
    return DateFormat(pattern).format(date);
  }

  static DateTime parseDate(String dateString, {String pattern = 'yMMMMd'}) {
    return DateFormat(pattern).parse(dateString);
  }

  static int daysBetween(DateTime from, DateTime to) {
    return to.difference(from).inDays;
  }
}
