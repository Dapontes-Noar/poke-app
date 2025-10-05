import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/presentation/notifiers/pokemon_details_notifier.dart';
import 'package:poke_app/features/home/presentation/widgets/pokemon_card_info_widget.dart';
import 'package:poke_app/shared/utils/poke_type_theme.dart';
import 'package:poke_app/styles/poke_styles.dart';
import 'pokemon_card_image_widget.dart';

class PokemonListCardWidget extends ConsumerWidget {
  final String pokemonUrl;

  const PokemonListCardWidget({super.key, required this.pokemonUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonDetailAsync = ref.watch(pokemonDetailsProvider(pokemonUrl));
    return pokemonDetailAsync.when(
      data: (PokemonDetailResponse pokemon) {
        return AspectRatio(
          aspectRatio: MediaQuery.of(context).size.width > 400
              ? 16 / 5
              : 16 / 6,
          child: Card(
            color: PokeTypeTheme.colorFor(
              pokemon.types.first.type.name,
            ).withValues(alpha: 0.5),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: $pokeStyles.border.pokeCardRadius,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: $pokeStyles.padding.pokeCardHorizontal,
                      vertical: $pokeStyles.padding.pokeCardVertical,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: $pokeStyles.border.pokeCardLeftRadius,
                    ),
                    child: PokemonCardInfoWidget(pokemon: pokemon),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: PokemonCardImageWidget(pokemon: pokemon),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) =>
          ListTile(title: Text('Error loading Pokémon: $error')),
    );
  }
}
