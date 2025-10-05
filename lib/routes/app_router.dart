import 'package:poke_app/features/detail/presentation/screens/poke_detail_screen.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/presentation/screens/poke_home_screen.dart';
import 'package:poke_app/features/favorites/presentation/screens/poke_favorites_screen.dart';
import 'package:poke_app/features/regions/presentation/screens/poke_regions_screen.dart';
import 'package:poke_app/features/profile/presentation/screens/poke_profile_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/routes/routes.dart';
import 'package:poke_app/routes/transitions/poke_back_custom_transition_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter buildAppRouter(Ref ref) => GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) =>
          buildPageWithTransition(child: PokeHomeScreen(), state: state),
    ),
    GoRoute(
      path: Routes.details,
      pageBuilder: (context, state) => buildPageWithTransition(
        child: PokeDetailScreen(pokemon: state.extra as PokemonDetailResponse),
        state: state,
      ),
    ),
    GoRoute(
      path: Routes.favorites,
      pageBuilder: (context, state) => buildPageWithTransition(
        child: const PokeFavoritesScreen(),
        state: state,
      ),
    ),
    GoRoute(
      path: Routes.regions,
      pageBuilder: (context, state) => buildPageWithTransition(
        child: const PokeRegionsScreen(),
        state: state,
      ),
    ),
    GoRoute(
      path: Routes.profile,
      pageBuilder: (context, state) => buildPageWithTransition(
        child: const PokeProfileScreen(),
        state: state,
      ),
    ),
  ],
);
