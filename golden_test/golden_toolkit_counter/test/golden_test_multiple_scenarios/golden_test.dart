import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:golden_toolkit_counter/counter_widget.dart';

void main() {
  testGoldens(
    'Counter widget 2',
    (WidgetTester tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.phone,
            Device.iphone11,
            Device.tabletPortrait,
            Device.tabletLandscape,
          ],
        )
        ..addScenario(
          widget: Counter(
            count: 0,
            key: const Key('increment_1'),
            onIncrement: () {},
            onReset: () {},
            isEnabled: true,
          ),
          name: 'initial state',
        )
        ..addScenario(
          widget: Counter(
            count: 5,
            key: const Key('increment_3'),
            onIncrement: () {},
            onReset: () {},
            isEnabled: true,
          ),
          name: 'counter is 5',
        )
        ..addScenario(
          widget: Counter(
            count: 0,
            key: const Key('increment_4'),
            onIncrement: () {},
            onReset: () {},
            isEnabled: false,
          ),
          name: 'disabled',
        )
        ..addScenario(
          widget: Counter(
            count: 0,
            key: const Key('increment_5'),
            onIncrement: () {},
            onReset: () {},
            isEnabled: false,
          ),
          name: 'incremented once',
          onCreate: (scenarioWidgetKey) async {
            final counterFinder = find.byKey(scenarioWidgetKey);
            expect(counterFinder, findsOneWidget);

            final incrementButtonFinder = find.descendant(
              of: counterFinder,
              matching: find.byType(ElevatedButton),
            );
            expect(incrementButtonFinder, findsOneWidget);

            await tester.tap(incrementButtonFinder);
          },
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'Counter_multiple_scenarios');
    },
  );
}
