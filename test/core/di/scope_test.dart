import 'package:flutter_test/flutter_test.dart';
import 'package:weather/core/di/scope.dart';

void main() {
  setUp(Scope.dispose);

  group('Scope', () {
    test('write and read a value', () {
      const value = 'test_value';
      Scope.write<String>(value);

      final result = Scope.read<String>();

      expect(result, equals(value), reason: 'Должно записывать и читать значение по типу');
    });

    test('readOrNull returns null if value not found', () {
      final result = Scope.readOrNull<String>();

      expect(result, isNull, reason: 'Должно возвращать null, если значение не найдено');
    });

    test('write replaces existing value when replace is true', () {
      const initialValue = 'initial_value';
      const newValue = 'new_value';
      Scope.write<String>(initialValue);
      Scope.write<String>(newValue, replace: true);

      final result = Scope.read<String>();

      expect(result, equals(newValue), reason: 'Должно заменять существующее значение, если replace = true');
    });

    test('write throws assertion error if value exists and replace is false', () {
      const value = 'test_value';
      Scope.write<String>(value);

      expect(
        () => Scope.write<String>('new_value'),
        throwsA(isA<AssertionError>()),
        reason: 'Должно бросать исключение, если значение уже существует и replace = false',
      );
    });

    test('dispose clears the registry', () {
      const value = 'test_value';
      Scope.write<String>(value);

      Scope.dispose();

      expect(
        () => Scope.read<String>(),
        throwsA(isA<AssertionError>()),
        reason: 'Должно очищать реестр и бросать исключение при попытке чтения после очистки',
      );
    });

    test('read throws assertion error if value not found', () {
      expect(
        () => Scope.read<String>(),
        throwsA(isA<AssertionError>()),
        reason: 'Должно бросать исключение, если значение не найдено',
      );
    });
  });
}
