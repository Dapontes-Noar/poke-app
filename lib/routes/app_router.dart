import 'package:poke_app/features/home/presentation/screens/home_screen.dart';
import 'package:poke_app/main.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter buildAppRouter(Ref ref) => GoRouter(
  initialLocation: '/home',
  routes: [GoRoute(path: '/home', builder: (context, state) => HomeScreen())],
);
