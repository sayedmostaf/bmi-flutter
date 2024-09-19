import 'package:intl/intl.dart';

extension DateTimeFormatted on DateTime {
  String format() {
    return DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY).format(this);
  }
}