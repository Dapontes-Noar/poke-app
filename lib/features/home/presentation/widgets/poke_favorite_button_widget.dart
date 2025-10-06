import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/features/favorites/presentation/notifiers/favorites_notifier.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeFavoriteButtonWidget extends ConsumerStatefulWidget {
  final String pokemonName;

  const PokeFavoriteButtonWidget({required this.pokemonName, super.key});

  @override
  ConsumerState<PokeFavoriteButtonWidget> createState() =>
      _PokeFavoriteButtonWidgetState();
}

class _PokeFavoriteButtonWidgetState
    extends ConsumerState<PokeFavoriteButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final favoriteState = ref.watch(favoritesProvider);
    final favoriteNotifier = ref.read(favoritesProvider.notifier);
    final isFavorite = favoriteNotifier.isFavorite(widget.pokemonName);
    favoriteState.whenData((favorites) {
      if (isFavorite) {
        setState(() {});
      }
    });
    return Padding(
      padding: EdgeInsets.all($pokeStyles.padding.pokefavoriteButton),
      child: IconButton(
        iconSize: 16,
        visualDensity: VisualDensity.compact,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            $pokeStyles.colors.favoriteButtonBgColor,
          ),
          side: WidgetStatePropertyAll(
            BorderSide(
              color: $pokeStyles.colors.favoriteButtonBorder,
              width: 2,
            ),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: $pokeStyles.border.pokeFavoriteButton,
            ),
          ),
        ),
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: isFavorite ? Colors.red : Colors.white,
        ),
        onPressed: () {
          favoriteNotifier.toggleFavorite(widget.pokemonName);
        },
      ),
    );
  }
}
