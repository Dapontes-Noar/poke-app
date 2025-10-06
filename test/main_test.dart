import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/main.dart';
import 'package:poke_app/routes/app_router.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('MyApp builds correctly and contains a MaterialApp.router', (
    tester,
  ) async {
    final fakeRouter = GoRouter(
      routes: [GoRoute(path: '/', builder: (_, _) => const Placeholder())],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [buildAppRouterProvider.overrideWithValue(fakeRouter)],
        child: const MyApp(),
      ),
    );

    await tester.pumpAndSettle();

    final materialAppFinder = find.byType(MaterialApp);
    expect(materialAppFinder, findsOneWidget);

    expect(tester.takeException(), isNull);

    expect(find.byType(Placeholder), findsOneWidget);
  });
}
