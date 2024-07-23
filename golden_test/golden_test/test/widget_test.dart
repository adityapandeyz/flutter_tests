import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:golden_test/main.dart';

void main() {
  testWidgets('Window config test', (WidgetTester tester) async {
    // Set the window size
    tester.binding.window.physicalSizeTestValue = Size(1080, 1920);

    // Set the device pixel ratio
    tester.binding.window.devicePixelRatioTestValue = 2.0;

    // Rebuild the widget with the new window properties
    await tester.pumpWidget(MyApp());

    // Perform your tests
    expect(find.text('0'), findsOneWidget);

    // Reset the window properties after the test
    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });
}
