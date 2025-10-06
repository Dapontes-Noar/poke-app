import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/core/utils/extensions/context_extensions.dart';
import 'package:poke_app/features/favorites/presentation/notifiers/favorites_notifier.dart';
import 'package:poke_app/features/favorites/presentation/widgets/poke_no_favorite_widget.dart';
import 'package:poke_app/features/home/presentation/widgets/poke_list_card_widget.dart';
import 'package:poke_app/shared/di/shared_providers.dart';
import 'package:poke_app/shared/utils/poke_icons.dart';
import 'package:poke_app/shared/widgets/poke_app_bar_widget.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeFavoritesScreen extends ConsumerWidget {
  const PokeFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavBar = ref.watch(pokeBottomNavigationBarProvider);
    final favoritesAsync = ref.watch(favoritesProvider);
    return Scaffold(
      bottomNavigationBar: bottomNavBar,
      appBar: PokeAppBarWidget(title: context.l10n.favoritesTitle),
      body: favoritesAsync.when(
        data: (favorites) {
          if (favorites.isEmpty) {
            return PokeNoFavoriteWidget();
          }
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(favorites[index]),
                  background: Container(
                    color: $pokeStyles.colors.deleteSwipeColor,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 38,
                      width: 38,
                      child: PokeIcons.deleteIcon,
                    ),
                  ),
                  onDismissed: (direction) {
                    ref
                        .read(favoritesProvider.notifier)
                        .removeFavorite(favorites[index]);
                  },
                  direction: DismissDirection.endToStart,
                  child: PokeListCardWidget(pokemonName: favorites[index]),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
