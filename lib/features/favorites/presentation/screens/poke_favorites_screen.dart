import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/features/favorites/presentation/widgets/poke_no_favorite_widget.dart';
import 'package:poke_app/shared/di/shared_providers.dart';

class PokeFavoritesScreen extends ConsumerWidget {
  const PokeFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavBar = ref.watch(pokeBottomNavigationBarProvider);
    return Scaffold(
      bottomNavigationBar: bottomNavBar,
      body: PokeNoFavoriteWidget(),
    );
  }
}
