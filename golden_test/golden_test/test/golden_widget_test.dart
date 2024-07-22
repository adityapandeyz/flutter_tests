import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_test/main.dart';

void main() {
  testWidgets(
    'Golden test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      await expectLater(
        find.byType(MyApp),
        matchesGoldenFile('counter_testImage.png'),
      );
    },
  );
}
