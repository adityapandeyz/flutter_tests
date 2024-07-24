import 'package:counter_riverpod_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Counter Provider Widget Test',
    () {
      testWidgets(
        'Counter start at 0',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const ProviderScope(
              child: MyApp(),
            ),
          );

          expect(find.text('0'), findsOneWidget);
          expect(find.text('1'), findsNothing);
        },
      );

      testWidgets(
        'Counter increment when FAB is tapped',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const ProviderScope(
              child: MyApp(),
            ),
          );

          await tester.tap(
            find.byType(FloatingActionButton),
          );
          await tester.pump();

          expect(find.text('0'), findsNothing);
          expect(find.text('1'), findsOneWidget);
        },
      );

      testWidgets(
        'Counter increments multiple times',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const ProviderScope(
              child: MyApp(),
            ),
          );

          for (int i = 0; i < 3; i++) {
            await tester.tap(
              find.byType(FloatingActionButton),
            );
            await tester.pump();
          }

          expect(find.text('0'), findsNothing);
          expect(find.text('3'), findsOneWidget);
        },
      );
    },
  );
}
