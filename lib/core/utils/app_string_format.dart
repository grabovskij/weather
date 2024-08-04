import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

/// Абстрактный класс для форматирования строк в приложении.
abstract class AppStringFormat {
  /// Инициализирует форматирование дат для заданной локали.
  ///
  /// [locale] - локаль для форматирования (по умолчанию 'ru_RU').
  static void init([String locale = 'ru_RU']) {
    Intl.defaultLocale = locale;
    initializeDateFormatting(locale);
  }

  /// Форматирует дату в полный формат 'дд МММ гггг'.
  ///
  /// [date] - объект даты для форматирования.
  ///
  /// Возвращает строку, представляющую дату в формате 'дд МММ гггг'.
  static String fullDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  /// Форматирует время в 24-часовой формат 'чч:мм'.
  ///
  /// [date] - объект даты для форматирования.
  ///
  /// Возвращает строку, представляющую время в формате 'чч:мм'.
  static String time24Hours(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }
}
