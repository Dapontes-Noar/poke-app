import 'package:flutter/material.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/shared/utils/poke_type_theme.dart';
import 'package:poke_app/styles/poke_styles.dart';
import 'poke_favorite_button_widget.dart';

class PokeCardImageWidget extends StatelessWidget {
  final PokemonDetailResponse pokemon;

  const PokeCardImageWidget({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: PokeTypeTheme.colorFor(pokemon.types.first.type.name),
        borderRadius: $pokeStyles.border.pokeCardRadius,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(4),
            child: PokeTypeTheme.whiteSpriteFor(pokemon.types.first.type.name),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              pokemon.sprites.frontDefault ?? '',
              fit: BoxFit.contain,
            ),
          ),
          const Positioned(top: 4, right: 4, child: PokeFavoriteButtonWidget()),
        ],
      ),
    );
  }
}
