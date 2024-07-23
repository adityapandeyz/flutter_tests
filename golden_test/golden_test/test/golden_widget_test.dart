import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_test/main.dart';

/// [WindowConfigData] for an iPhone 13
// final WindowConfigData iphone13 = WindowConfigData(
//   physicalSize: Size(1170, 2532),
//   devicePixelRatio: 3.0,
// );

final variant = ValueVariant<TargetPlatform>({
  TargetPlatform.iOS,
  TargetPlatform.android,
});

void main() {
  testWidgets(
    'Golden test',
    (WidgetTester tester) async {
      debugDefaultTargetPlatformOverride = variant.currentValue;
      debugDisableShadows = false;

      await tester.pumpWidget(
        const MaterialApp(
          home: MyApp(),
        ),
      );

      await expectLater(
        find.byType(MyApp),
        matchesGoldenFile('counter_testImage.png'),
      );

      debugDefaultTargetPlatformOverride = null;
      debugDisableShadows = true;
    },
    variant: variant,
  );
}
