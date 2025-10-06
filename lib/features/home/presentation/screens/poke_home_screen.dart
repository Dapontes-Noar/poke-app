import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/features/home/data/models/all_pokemons_response.dart';
import 'package:poke_app/features/home/presentation/notifiers/home_notifier.dart';
import 'package:poke_app/features/home/presentation/widgets/poke_list_card_widget.dart';
import 'package:poke_app/shared/di/shared_providers.dart';
import 'package:poke_app/shared/utils/poke_icons.dart';
import 'package:poke_app/shared/widgets/poke_home_app_bar_widget.dart';
import 'package:poke_app/styles/poke_styles.dart';

/// HomeScreen displays a list of Pokémons and handles loading and error states.
class PokeHomeScreen extends ConsumerStatefulWidget {
  const PokeHomeScreen({super.key});

  @override
  ConsumerState<PokeHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<PokeHomeScreen> {
  String? _lastErrorMsg;

  /// Shows a snackbar for errors, only if it's a new error.
  void _showErrorSnackbar(String errorMsg) {
    if (_lastErrorMsg != errorMsg && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          key: const ValueKey('pokemon_error_snackbar'),
          content: Text('Failed to load Pokémons: $errorMsg'),
        ),
      );
      _lastErrorMsg = errorMsg;
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncPokemons = ref.watch(homeNotifierProvider);
    final bottomNavBar = ref.watch(pokeBottomNavigationBarProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (asyncPokemons is AsyncError) {
        final errorMsg = asyncPokemons.error.toString();
        _showErrorSnackbar(errorMsg);
      } else {
        _lastErrorMsg = null;
      }
    });
    return Scaffold(
      appBar: PokeHomeAppBarWidget(),
      backgroundColor: $pokeStyles.colors.scaffoldBgColor,
      bottomNavigationBar: bottomNavBar,
      body: asyncPokemons.when(
        data: (AllPokemonsResponse data) {
          if (data.results.isEmpty) {
            return const Center(child: Text('No Pokémons found.'));
          }
          return ListView.builder(
            itemCount: data.results.length,
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            itemBuilder: (context, index) {
              final pokemon = data.results[index];
              return PokeListCardWidget(pokemonName: pokemon.name);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Failed to load Pokémons.'),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  ref.read(homeNotifierProvider.notifier).fetchAllPokemons();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(homeNotifierProvider.notifier).fetchAllPokemons();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
