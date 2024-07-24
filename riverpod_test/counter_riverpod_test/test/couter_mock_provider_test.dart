import 'package:counter_riverpod_test/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCounter extends StateNotifier<int> {
  MockCounter() : super(42);
  void increment() => state++;
}

void main() {
  test(
    'Mocking Counter Provider',
    () {
      final container = ProviderContainer(
        overrides: [
          counterProvider.overrideWith((ref) => MockCounter() as Counter),
        ],
      );

      addTearDown(container.dispose);

      final counter = container.read(counterProvider.notifier);
      counter.increment();

      expect(container.read(counterProvider), 43);
    },
  );
}
