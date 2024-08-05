import 'package:flutter_test/flutter_test.dart';
import 'package:weather/core/utils/debouncer.dart';

void main() {
  group('Debouncer', () {
    test('callback is called after the delay', () async {
      var wasCalled = false;
      final debouncer = Debouncer(const Duration(milliseconds: 100));

      debouncer.debounce(() {
        wasCalled = true;
      });

      expect(wasCalled, isFalse, reason: 'Callback should not be called immediately');

      await Future.delayed(const Duration(milliseconds: 150));

      expect(wasCalled, isTrue, reason: 'Callback should be called after the delay');
    });

    test('callback is not called if debounced again within the delay', () async {
      var wasCalled = false;
      final debouncer = Debouncer(const Duration(milliseconds: 100));

      debouncer.debounce(() {
        wasCalled = true;
      });

      debouncer.debounce(() {
        wasCalled = true;
      });

      await Future.delayed(const Duration(milliseconds: 50));
      expect(wasCalled, isFalse, reason: 'Callback should not be called yet');

      await Future.delayed(const Duration(milliseconds: 60));
      expect(wasCalled, isTrue, reason: 'Callback should be called after the delay');
    });

    test('callback is called only once after multiple rapid calls', () async {
      var callCount = 0;
      final debouncer = Debouncer(const Duration(milliseconds: 100));

      debouncer.debounce(() {
        callCount++;
      });

      debouncer.debounce(() {
        callCount++;
      });

      debouncer.debounce(() {
        callCount++;
      });

      await Future.delayed(const Duration(milliseconds: 150));

      expect(callCount, equals(1), reason: 'Callback should be called only once');
    });

    test('dispose cancels the timer', () async {
      var wasCalled = false;
      final debouncer = Debouncer(const Duration(milliseconds: 100));

      debouncer.debounce(() {
        wasCalled = true;
      });

      debouncer.dispose();

      await Future.delayed(const Duration(milliseconds: 150));

      expect(wasCalled, isFalse, reason: 'Callback should not be called if debouncer is disposed');
    });
  });
}
