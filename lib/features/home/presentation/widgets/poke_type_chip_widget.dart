import 'package:flutter/material.dart';
import 'package:poke_app/core/utils/extensions/string_extensions.dart';
import 'package:poke_app/features/home/data/models/pokemon_type_response.dart';
import 'package:poke_app/shared/utils/poke_type_theme.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeTypeChipWidget extends StatelessWidget {
  final TypeInfoResponse pokemonType;

  const PokeTypeChipWidget({super.key, required this.pokemonType});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.symmetric(
        vertical: $pokeStyles.padding.pokeChipVertical,
        horizontal: $pokeStyles.padding.pokeChipHorizontal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: $pokeStyles.border.pokeChipRadius,
      ),
      side: BorderSide.none,
      visualDensity: VisualDensity.standard,
      elevation: 0,
      backgroundColor: PokeTypeTheme.colorFor(pokemonType.name),
      avatar: CircleAvatar(
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all($pokeStyles.padding.typeChipAvatar),
          child: PokeTypeTheme.spriteFor(pokemonType.name),
        ),
      ),
      label: Text(
        pokemonType.name.toCapitalize(),
        style: $pokeStyles.text.typeChipLabel,
      ),
    );
  }
}
