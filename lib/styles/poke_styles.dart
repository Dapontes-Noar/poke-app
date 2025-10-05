import 'package:flutter/material.dart';

import 'poke_colors.dart';

/// Centralized styles for Pokemon list card and related widgets.
@immutable
class PokeStyles {
  late final text = _PokeText();
  late final colors = PokeColors();
  late final padding = _PokePadding();
  late final container = _PokeContainer(_PokeBorder());
  late final border = _PokeBorder();
}

/// Text styles using Poppins font.
@immutable
class _PokeText {
  final String? fontFamily = 'Poppins';

  late final TextStyle pokeIDText;
  late final TextStyle pokeName;
  late final TextStyle typeChipLabel;

  _PokeText() {
    pokeIDText = TextStyle(
      color: $pokeStyles.colors.pokeIDColor,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    );
    pokeName = TextStyle(
      color: $pokeStyles.colors.pokeNameColor,
      fontSize: 21,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    );
    typeChipLabel = TextStyle(
      color: $pokeStyles.colors.typeChipLabel,
      fontSize: 11,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    );
  }
}

/// Padding values for consistent spacing.
class _PokePadding {
  final double pokeCardHorizontal = 16.0;
  final double pokeCardVertical = 12.1;
  final double pokeChipVertical = 2.9;
  final double pokeChipHorizontal = 6.0;
  final double pokefavoriteButton = 8.0;
  final double typeChipAvatar = 3.0;
}

/// Container and shape styles.
class _PokeContainer {
  final BoxDecoration pokeCard;
  final BoxDecoration pokeCardAccent;
  final BoxDecoration typeChipAvatar;
  final BoxDecoration favoriteButton;

  _PokeContainer(_PokeBorder border)
    : pokeCard = BoxDecoration(
        color: $pokeStyles.colors.fireTypeColor.withValues(alpha: 0.5),
        borderRadius: border.pokeCardRadius,
      ),
      pokeCardAccent = BoxDecoration(
        color: $pokeStyles.colors.fireTypeColor,
        borderRadius: border.pokeCardRadius,
      ),
      typeChipAvatar = const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      favoriteButton = BoxDecoration(
        color: $pokeStyles.colors.favoriteButtonBgColor,
        border: Border.all(
          color: $pokeStyles.colors.favoriteButtonBorder,
          width: 2,
        ),
        shape: BoxShape.circle,
      );
}

/// Border and radius styles.
class _PokeBorder {
  final BorderRadius pokeCardRadius = const BorderRadius.all(
    Radius.circular(16),
  );
  final BorderRadius pokeCardLeftRadius = const BorderRadius.only(
    topLeft: Radius.circular(16),
    bottomLeft: Radius.circular(16),
  );
  final BorderRadius pokeChipRadius = const BorderRadius.all(
    Radius.circular(48.61),
  );
  final BorderRadius pokeFavoriteButton = BorderRadius.circular(50);
}

/// Singleton instance for global access.
final PokeStyles $pokeStyles = PokeStyles();
