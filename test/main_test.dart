import 'package:flutter_test/flutter_test.dart';
import 'package:poke_app/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('App renders and shows Pokédex title', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(ProviderScope(child: MyApp()));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.text('Pokédex'), findsOneWidget);
  });
}
