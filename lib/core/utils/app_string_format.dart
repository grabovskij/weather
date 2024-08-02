import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

abstract class AppStringFormat {
  static void init([String locale = 'ru_RU']) {
    Intl.defaultLocale = locale;
    initializeDateFormatting(locale);
  }

  static String fullDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String time24Hours(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }
}
