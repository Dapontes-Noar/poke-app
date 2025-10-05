import 'package:flutter/material.dart';
import 'package:poke_app/styles/poke_styles.dart';

class FavoriteButtonWidget extends StatefulWidget {
  const FavoriteButtonWidget({super.key});

  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  bool _isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          _isFavorite ? Icons.favorite : Icons.favorite_border,
          color: _isFavorite ? Colors.red : Colors.white,
        ),
        onPressed: _toggleFavorite,
      ),
    );
  }
}
