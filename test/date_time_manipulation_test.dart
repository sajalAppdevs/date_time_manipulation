import 'package:date_time_manipulation/date_time_manipulation.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test('Days between test', () {
    final from = DateTime(2023, 1, 1);
    final to = DateTime(2023, 1, 11);
    expect(DateUtilsHelper.daysBetween(from, to), 10);
  });

  test('Format & Parse', () {
    final now = DateTime.now();
    final formatted = DateUtilsHelper.formatDate(now);
    final parsed = DateUtilsHelper.parseDate(formatted);
    expect(parsed.day, now.day);
  });
}
