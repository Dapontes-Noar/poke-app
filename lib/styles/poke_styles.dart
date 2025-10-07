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
  late final TextStyle bottomNavigationLabel;
  late final TextStyle comingSoonTitle;
  late final TextStyle comingSoonDescription;
  late final TextStyle bottomNavigationLabelSelected;
  late final TextStyle bottomNavigationLabelUnselected;
  late final TextStyle pokeAppTitle;
  late final TextStyle pokeSubTitleIcon;
  late final TextStyle noFavoritesDescription;
  late final TextStyle pokeAppBarTitle;
  late final TextStyle homeAppBarSearchHint;
  late final TextStyle homeAppBarSearchInput;
  late final TextStyle homeAppBarActionIcon;
  late final TextStyle filterOptionsLabel;
  late final TextStyle pokeButtonLabel;
  late final TextStyle navBarFilterLabel;
  late final TextStyle navBarFilterCleanLabel;
  late final TextStyle pokeMeasuresLabel;
  late final TextStyle pokeDetailName;
  late final TextStyle pokeDetailId;
  late final TextStyle pokeDetailDescription;

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
    bottomNavigationLabel = TextStyle(
      color: $pokeStyles.colors.bottomNavigationLabelUnselectColor,
      fontSize: 10,
      fontWeight: FontWeight.w700,
      fontFamily: fontFamily,
    );
    comingSoonTitle = TextStyle(
      color: $pokeStyles.colors.pokeNameColor,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    );
    comingSoonDescription = TextStyle(
      color: $pokeStyles.colors.pokeNameColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: fontFamily,
    );
    pokeAppTitle = TextStyle(
      color: $pokeStyles.colors.pokeNameColor,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    );
    noFavoritesDescription = TextStyle(
      color: $pokeStyles.colors.pokeNameColor,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: fontFamily,
    );
    bottomNavigationLabelSelected = TextStyle(
      fontSize: 10,
      color: $pokeStyles.colors.bottomNavigationLabelSelectColor,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
    );
    bottomNavigationLabelUnselected = TextStyle(
      fontSize: 10,
      color: $pokeStyles.colors.bottomNavigationLabelUnselectColor,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
    );
    pokeAppBarTitle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
      color: $pokeStyles.colors.pokeNameColor,
    );
    homeAppBarSearchHint = TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      color: $pokeStyles.colors.appBarSearchBorderColor,
      fontWeight: FontWeight.w400,
    );
    homeAppBarSearchInput = TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      color: $pokeStyles.colors.pokeNameColor,
      fontWeight: FontWeight.w400,
    );
    homeAppBarActionIcon = TextStyle(
      color: $pokeStyles.colors.appBarSearchBorderColor,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontFamily: fontFamily,
    );
    pokeSubTitleIcon = TextStyle(
      color: $pokeStyles.colors.pokeNameColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    );
    filterOptionsLabel = TextStyle(
      fontSize: 14,
      color: $pokeStyles.colors.filterLabelColor,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
    );
    pokeButtonLabel = TextStyle(
      color: $pokeStyles.colors.pokeNameColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: fontFamily,
    );
    navBarFilterLabel = TextStyle(
      fontSize: 14,
      color: $pokeStyles.colors.filterLabelColor,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
    );
    navBarFilterCleanLabel = TextStyle(
      decoration: TextDecoration.underline,
      fontSize: 14,
      color: $pokeStyles.colors.filterPrimaryButtonColor,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
    );
    pokeMeasuresLabel = TextStyle(
      color: $pokeStyles.colors.pokeIDColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: fontFamily,
    );
    pokeDetailName = TextStyle(
      color: $pokeStyles.colors.pokeNameColor,
      fontFamily: fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w500,
    );
    pokeDetailId = TextStyle(
      color: $pokeStyles.colors.pokeIDColor,
      fontFamily: fontFamily,
      fontSize: 15,
      fontWeight: FontWeight.w500,
    );
    pokeDetailDescription = TextStyle(
      color: Colors.black87,
      fontFamily: fontFamily,
      fontSize: 15,
      fontWeight: FontWeight.w400,
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

  late final EdgeInsets homeAppBarTitlePadding;
  late final EdgeInsets homeAppBarActionPadding;
  late final EdgeInsets homeAppBarSearchPadding;
  late final BorderRadius homeAppBarActionBorderRadius;
  late final BorderSide homeAppBarActionBorderSide;

  _PokePadding() {
    homeAppBarTitlePadding = const EdgeInsets.only(left: 8.0, top: 22);
    homeAppBarActionPadding = const EdgeInsets.only(top: 22.0);
    homeAppBarSearchPadding = const EdgeInsets.symmetric(horizontal: 16.0);
  }
}

/// Container and shape styles.
class _PokeContainer {
  final BoxDecoration pokeCard;
  final BoxDecoration pokeCardAccent;
  final BoxDecoration typeChipAvatar;
  final BoxDecoration favoriteButton;
  final EdgeInsets bottomNavigationBarPadding;
  final BorderRadius bottomNavigationBarRadius;
  final List<BoxShadow> bottomNavigationBarShadow;

  late final RoundedRectangleBorder homeAppBarActionBorderRadius;
  late final BorderSide homeAppBarActionBorderSide;

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
      ),
      bottomNavigationBarPadding = const EdgeInsets.symmetric(
        vertical: 16.5,
        horizontal: 16,
      ),
      bottomNavigationBarRadius = const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      bottomNavigationBarShadow = [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          spreadRadius: 0,
          blurRadius: 3,
          offset: const Offset(0, -5),
        ),
      ],
      homeAppBarActionBorderRadius = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      homeAppBarActionBorderSide = BorderSide(
        color: $pokeStyles.colors.appBarSearchBorderColor,
        width: 1.5,
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
