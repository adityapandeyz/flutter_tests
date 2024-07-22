import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:golden_toolkit_counter/counter_widget.dart';

void main() {
  testGoldens(
    'Counter widget 1',
    (WidgetTester tester) async {
      // State 1: Initial state
      final counterInitialState = Counter(
        count: 0,
        onIncrement: () {},
        onReset: () {},
        isEnabled: true,
      );

      // State 2: Counter after increment
      final counterIncrementedState = Counter(
        count: 1,
        onIncrement: () {},
        onReset: () {},
        isEnabled: true,
      );

      // State 3: Counter disabled
      final counterDisabledState = Counter(
        count: 0,
        onIncrement: () {},
        onReset: () {},
        isEnabled: false,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: counterInitialState,
            ),
          ),
        ),
      );

      await multiScreenGolden(
        tester,
        'counter_initial',
        devices: [
          Device.iphone11,
          Device.phone.copyWith(name: "smallPhone"),
          const Device(
            name: "custom_device",
            devicePixelRatio: 2,
            size: Size(540, 960),
          ),
        ],
      );

      // Pump the incremented state and capture a new golden
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(child: counterIncrementedState),
          ),
        ),
      );

      await multiScreenGolden(
        tester,
        'counter_incremented',
        devices: [
          Device.iphone11,
          Device.phone.copyWith(name: "smallPhone"),
          const Device(
            name: "custom_device",
            devicePixelRatio: 2,
            size: Size(540, 960),
          ),
        ],
      );

      // Pump the disabled state and capture a new golden
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(child: counterDisabledState),
          ),
        ),
      );

      await multiScreenGolden(
        tester,
        'counter_disabled',
        devices: [
          Device.iphone11,
          Device.phone.copyWith(name: "smallPhone"),
          const Device(
            name: "custom_device",
            devicePixelRatio: 2,
            size: Size(540, 960),
          ),
        ],
      );
    },
  );
}
