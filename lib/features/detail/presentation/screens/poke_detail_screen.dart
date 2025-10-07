import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/core/utils/extensions/context_extensions.dart';
import 'package:poke_app/core/utils/extensions/string_extensions.dart';
import 'package:poke_app/features/detail/presentation/notifiers/pokemon_details_notifier.dart';
import 'package:poke_app/features/detail/presentation/widgets/poke_detail_app_bar_widget.dart';
import 'package:poke_app/features/detail/presentation/widgets/poke_detail_gender_bar_widget.dart';
import 'package:poke_app/features/detail/presentation/widgets/poke_detail_header_widget.dart';
import 'package:poke_app/features/detail/presentation/widgets/poke_detail_info_grid_widget.dart';
import 'package:poke_app/features/detail/presentation/widgets/poke_detail_info_widget.dart';
import 'package:poke_app/features/detail/presentation/widgets/poke_detail_weaknesses_widget.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/shared/utils/poke_icons.dart';
import 'package:poke_app/shared/widgets/poke_bottom_navigation_bar_widget.dart';
import 'package:poke_app/shared/widgets/poke_general_error_widget.dart';
import 'package:poke_app/styles/poke_styles.dart';

class PokeDetailScreen extends ConsumerWidget {
  final PokemonDetailResponse pokemon;

  const PokeDetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsProvider = ref.watch(
      pokemonDetailsProvider(pokemon.name, pokemon.types.first.type.name),
    );
    final ability = pokemon.abilities.isNotEmpty
        ? pokemon.abilities.first.ability.name
        : '';
    return Scaffold(
      backgroundColor: $pokeStyles.colors.scaffoldBgColor,
      extendBodyBehindAppBar: true,
      appBar: PokeDetailAppBarWidget(pokemonName: pokemon.name),
      bottomNavigationBar: PokeBottomNavigationBarWidget(),
      body: detailsProvider.when(
        data: (data) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PokeDetailHeaderWidget(pokemon: pokemon),
              Padding(
                padding: const EdgeInsets.all(16),
                child: PokeDetailInfoWidget(
                  pokemon: pokemon,
                  description:
                      data.species?.formDescriptions != null &&
                          data.species!.formDescriptions.isNotEmpty
                      ? data.species?.formDescriptions.first.description ?? ''
                      : context.l10n.pokemonGeneralDescription,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Divider(),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: PokeDetailInfoGridWidget(
                  weight: '${pokemon.weight / 10} kg',
                  height: '${pokemon.height / 10} m',
                  category:
                      data.species?.genera
                          .firstWhere((genus) => genus.language.name == 'en')
                          .genus
                          .replaceAll('Pokémon', '') ??
                      '',
                  ability: ability.toCapitalize(),
                  icons: [
                    PokeIcons.weightIcon,
                    PokeIcons.heightIcon,
                    PokeIcons.categoryIcon,
                    PokeIcons.pokeballIcon,
                  ],
                ),
              ),
              // Gender bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PokeDetailGenderBarWidget(
                  genderRate: data.species!.genderRate,
                ),
              ),
              // Weaknesses
              PokeDetailWeaknessesWidget(
                doubleDamageFrom: data.type?.damageRelations.doubleDamageFrom,
              ),
            ],
          ),
        ),
        error: (e, _) => PokeGeneralErrorWidget(onRetry: () {}),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
