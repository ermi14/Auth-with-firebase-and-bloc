import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_task/src/presentation/home/home_screen.dart';

void main() {
  testWidgets('Home screen widget test', (WidgetTester tester) async {
    
    await tester.pumpWidget(
      const MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: HomeScreen()
        )
      )
    );

    expect(find.text("Welome to your home page"), findsOneWidget);

    expect(find.text('Logout'), findsOneWidget);

    expect(find.text('Login'), findsNothing);
  });
}