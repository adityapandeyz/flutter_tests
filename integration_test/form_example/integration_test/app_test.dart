import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_example/home_screen.dart';
import 'package:integration_test/integration_test.dart';
import 'package:form_example/main.dart' as app;

// widget testing works in isolated environment but integration realy tests the app

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group(
    'end to end test',
    () {
      testWidgets(
        'Verify login screen with correct uername and password',
        (tester) async {
          app.main();
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 2));
          await tester.enterText(find.byType(TextFormField).at(0), 'username');
          await Future.delayed(const Duration(seconds: 2));
          await tester.enterText(find.byType(TextFormField).at(1), 'password');
          await Future.delayed(const Duration(seconds: 2));
          await tester.tap(find.byType(ElevatedButton));
          await Future.delayed(const Duration(seconds: 2));
          await tester.pumpAndSettle();

          await Future.delayed(const Duration(seconds: 2));
          expect(find.byType(HomeScreen), findsOneWidget);
        },
      );

      testWidgets(
        'Verify login screen with incorrect uername and password',
        (tester) async {
          app.main();
          await tester.pumpAndSettle();
          await Future.delayed(const Duration(seconds: 2));
          await tester.enterText(
              find.byType(TextFormField).at(0), 'wrong_username');
          await Future.delayed(const Duration(seconds: 2));
          await tester.enterText(
              find.byType(TextFormField).at(1), 'wrong_password');
          await Future.delayed(const Duration(seconds: 2));
          await tester.tap(find.byType(ElevatedButton));
          await Future.delayed(const Duration(seconds: 2));
          await tester.pumpAndSettle();

          await Future.delayed(const Duration(seconds: 2));
          expect(find.text('Invalid username or password'), findsOneWidget);
        },
      );
    },
  );
}
