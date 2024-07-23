import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_riverpod_test/main.dart';

void main() {
  group(
    'Counter Provider Test',
    () {
      test(
        'Counter Increment',
        () {
          // Create a provider container
          final container = ProviderContainer();
          addTearDown(container.dispose);

          // Read the inital value of the counter
          expect(container.read(counterProvider), 0);

          // Increment the counter
          container.read(counterProvider.notifier).state++;

          // Verify the counter value has incremented
          expect(container.read(counterProvider), 1);
        },
      );

      test(
        'Counter increment multiple times',
        () {
          // Create a provider container
          final container = ProviderContainer();
          addTearDown(container.dispose);

          // Increment the counter
          container.read(counterProvider.notifier).state++;
          container.read(counterProvider.notifier).state++;
          container.read(counterProvider.notifier).state++;

          // Verify the counter value has incremented
          expect(container.read(counterProvider), 3);
        },
      );
    },
  );
}
