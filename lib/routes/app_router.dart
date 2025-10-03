import 'package:poke_app/main.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter buildAppRouter(Ref ref) => GoRouter(
  initialLocation: '/home',
  routes: [GoRoute(path: '/home', builder: (context, state) => MyHomePage())],
);
