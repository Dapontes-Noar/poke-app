import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_app/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('App renders MyHomePage and increments counter', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MyApp());
    expect(
      find.text('You have pushed the button this many times:'),
      findsOneWidget,
    );
    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });
}
