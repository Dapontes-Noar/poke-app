import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/core/utils/extensions/string_extensions.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/presentation/notifiers/pokemon_details_notifier.dart';
import 'package:poke_app/shared/utils/poke_images.dart';

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
            color: const Color.fromRGBO(255, 152, 0, 0.5),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12.1,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nº ${pokemon.id.toString().padLeft(3, '0')}',
                          style: const TextStyle(
                            color: Color.fromRGBO(66, 66, 66, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          pokemon.name.toCapitalize(),
                          style: const TextStyle(
                            color: Color.fromRGBO(18, 18, 18, 1),
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const MaxGap(4),
                        Chip(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.9,
                            horizontal: 6,
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(48.61),
                            ),
                          ),
                          side: BorderSide.none,
                          visualDensity: VisualDensity.standard,
                          elevation: 0,
                          backgroundColor: const Color.fromRGBO(255, 152, 0, 1),
                          avatar: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(3),
                              child: PokeImages.fireSprite,
                            ),
                          ),
                          label: Text(
                            pokemon.types.first.type.name,
                            style: TextStyle(
                              color: Color.fromRGBO(250, 250, 250, 1),
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 152, 0, 1),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          padding: const EdgeInsets.all(4),
                          child: PokeImages.fireSpriteWhite,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Image.network(
                            pokemon.sprites.frontDefault ?? '',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
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
