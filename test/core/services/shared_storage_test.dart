import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/core/services/shared_storage.dart';

void main() {
  group('SharedStorage', () {
    late SharedStorage sharedStorage;
    late SharedPreferences sharedPreferences;

    setUp(() async {
      SharedPreferences.setMockInitialValues({}); // Устанавливаем начальные значения
      sharedPreferences = await SharedPreferences.getInstance();
      sharedStorage = SharedStorage(sharedPreferences);
    });

    test('getString returns the correct value', () async {
      // Arrange
      const testKey = 'testKey';
      const testValue = 'testValue';
      await sharedPreferences.setString(testKey, testValue);

      // Act
      final result = sharedStorage.getString(testKey);

      // Assert
      expect(result, testValue);
    });

    test('setString saves the correct value', () async {
      // Arrange
      const testKey = 'testKey';
      const testValue = 'testValue';

      // Act
      final saveResult = await sharedStorage.setString(key: testKey, value: testValue);
      final storedValue = sharedPreferences.getString(testKey);

      // Assert
      expect(saveResult, true);
      expect(storedValue, testValue);
    });
  });
}
