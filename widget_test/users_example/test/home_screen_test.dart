import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:users_example/home_screen.dart';
import 'package:users_example/user_model.dart';

void main() {
  testWidgets(
    'Display List of users with title as name and subtitle as email',
    (tester) async {
      final users = [
        User(
          id: 1,
          name: 'Aditya',
          email: 'aditya@outlook.com',
        ),
        User(
          id: 2,
          name: 'Shiven',
          email: 'shiven@gmail.com',
        ),
      ];

      Future<List<User>> mockFetchUsers() async {
        return Future.delayed(const Duration(seconds: 1), () => users);
        // return users;
      }

      // isolated widget tree
      await tester.pumpWidget(
        MaterialApp(
          home: HomeScreen(
            futureUsers: mockFetchUsers(),
          ),
        ),
      );

      expect(
        find.byType(CircularProgressIndicator),
        findsOneWidget,
      );

      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);

      expect(find.byType(ListTile), findsNWidgets(users.length));

      for (final user in users) {
        expect(find.text(user.name), findsOneWidget);
        expect(find.text(user.email), findsOneWidget);
      }
    },
  );
}
