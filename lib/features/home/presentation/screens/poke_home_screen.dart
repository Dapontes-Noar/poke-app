import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/features/home/data/models/all_pokemons_response.dart';
import 'package:poke_app/features/home/presentation/notifiers/home_notifier.dart';
import 'package:poke_app/features/home/presentation/widgets/poke_list_card_widget.dart';
import 'package:poke_app/shared/di/shared_providers.dart';
import 'package:poke_app/features/home/presentation/widgets/poke_home_app_bar_widget.dart';
import 'package:poke_app/shared/widgets/poke_general_error_widget.dart';
import 'package:poke_app/styles/poke_styles.dart';

/// HomeScreen displays a list of Pokémons and handles loading and error states.
class PokeHomeScreen extends ConsumerStatefulWidget {
  const PokeHomeScreen({super.key});

  @override
  ConsumerState<PokeHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<PokeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncPokemons = ref.watch(homeNotifierProvider);
    final bottomNavBar = ref.watch(pokeBottomNavigationBarProvider);
    return Scaffold(
      appBar: PokeHomeAppBarWidget(),
      backgroundColor: $pokeStyles.colors.scaffoldBgColor,
      bottomNavigationBar: bottomNavBar,
      body: asyncPokemons.when(
        data: (AllPokemonsResponse data) {
          if (data.results.isNotEmpty) {
            return ListView.builder(
              itemCount: data.results.length,
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              itemBuilder: (context, index) {
                final pokemon = data.results[index];
                return PokeListCardWidget(pokemonName: pokemon.name);
              },
            );
          } else {
            throw Exception('No Pokémons found');
          }
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => PokeGeneralErrorWidget(
          onRetry: ref.read(homeNotifierProvider.notifier).fetchAllPokemons,
        ),
      ),
    );
  }
}
