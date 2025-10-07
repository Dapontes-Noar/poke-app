import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/features/favorites/presentation/notifiers/favorites_notifier.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeFavoriteButtonWidget extends ConsumerStatefulWidget {
  final String pokemonName;
  final Color? bgColor;
  final bool hasBorder;
  final double? iconSize;

  const PokeFavoriteButtonWidget({
    required this.pokemonName,
    this.bgColor,
    this.hasBorder = true,
    this.iconSize,
    super.key,
  });

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
        iconSize: widget.iconSize ?? 16,
        visualDensity: VisualDensity.compact,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            widget.bgColor ?? $pokeStyles.colors.favoriteButtonBgColor,
          ),
          side: WidgetStatePropertyAll(
            widget.hasBorder
                ? BorderSide(
                    color: $pokeStyles.colors.favoriteButtonBorder,
                    width: 2,
                  )
                : BorderSide.none,
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
