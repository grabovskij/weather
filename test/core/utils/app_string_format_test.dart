import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weather/core/utils/app_string_format.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('ru_RU');
    AppStringFormat.init('ru_RU');
  });

  group('AppStringFormat', () {
    test('formats full date correctly', () {
      final date = DateTime(2023, 8, 5);
      final formattedDate = AppStringFormat.fullDate(date);

      expect(formattedDate, '05 авг. 2023', reason: 'Должно форматировать дату в формате "дд МММ гггг"');
    });

    test('formats time in 24-hour format correctly', () {
      final date = DateTime(2023, 8, 5, 14, 30);
      final formattedTime = AppStringFormat.time24Hours(date);

      expect(formattedTime, '14:30', reason: 'Должно форматировать время в формате "чч:мм"');
    });

    test('initializes with default locale', () {
      AppStringFormat.init();
      final date = DateTime(2023, 8, 5);
      final formattedDate = AppStringFormat.fullDate(date);

      expect(formattedDate, '05 авг. 2023', reason: 'Должно форматировать дату в формате "дд МММ гггг" по умолчанию');
    });

    test('initializes with a different locale', () async {
      await initializeDateFormatting('en_US');
      AppStringFormat.init('en_US');
      final date = DateTime(2023, 8, 5);
      final formattedDate = AppStringFormat.fullDate(date);

      expect(formattedDate, '05 Aug 2023',
          reason: 'Должно форматировать дату в формате "dd MMM yyyy" для локали en_US');
    });
  });
}
