import 'package:poke_app/features/detail/presentation/screens/pokemon_detail_screen.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter buildAppRouter(Ref ref) => GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/detail',
      builder: (context, state) =>
          PokemonDetailScreen(pokemon: state.extra as PokemonDetailResponse),
    ),
  ],
);
