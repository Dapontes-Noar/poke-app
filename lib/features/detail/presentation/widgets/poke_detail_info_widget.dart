import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:poke_app/core/utils/extensions/string_extensions.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/presentation/widgets/poke_type_chip_widget.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeDetailInfoWidget extends StatelessWidget {
  final PokemonDetailResponse pokemon;
  final String description;

  const PokeDetailInfoWidget({
    super.key,
    required this.pokemon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pokemon.name.toCapitalize(),
          style: $pokeStyles.text.pokeDetailName,
        ),
        const SizedBox(width: 8),
        Text(
          'N°${pokemon.id.toString().padLeft(3, '0')}',
          style: $pokeStyles.text.pokeDetailId,
        ),
        Gap(24),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: pokemon.types
              .map((type) => PokeTypeChipWidget(pokemonType: type.type))
              .toList(),
        ),
        const SizedBox(height: 12),
        Text(
          description,
          textAlign: TextAlign.justify,
          style: $pokeStyles.text.pokeDetailDescription,
        ),
      ],
    );
  }
}
