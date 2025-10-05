import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:poke_app/core/utils/extensions/string_extensions.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/styles/poke_styles.dart';
import 'pokemon_type_chip_widget.dart';

class PokemonCardInfoWidget extends StatelessWidget {
  final PokemonDetailResponse pokemon;

  const PokemonCardInfoWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nº ${pokemon.id.toString().padLeft(3, '0')}',
          style: $pokeStyles.text.pokeIDText,
        ),
        Text(pokemon.name.toCapitalize(), style: $pokeStyles.text.pokeName),
        const MaxGap(4),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: pokemon.types
              .map((type) => PokemonTypeChipWidget(pokemonType: type))
              .toList(),
        ),
      ],
    );
  }
}
