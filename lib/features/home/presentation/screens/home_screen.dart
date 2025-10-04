import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/features/home/data/models/all_pokemons_response.dart';
import 'package:poke_app/features/home/presentation/notifiers/home_notifier.dart';
import 'package:poke_app/features/home/presentation/widgets/pokemon_list_card_widget.dart';

/// HomeScreen displays a list of Pokémons and handles loading and error states.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (asyncPokemons is AsyncError) {
        final errorMsg = asyncPokemons.error.toString();
        _showErrorSnackbar(errorMsg);
      } else {
        _lastErrorMsg = null;
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Pokédex')),
      body: asyncPokemons.when(
        data: (AllPokemonsResponse data) {
          if (data.results.isEmpty) {
            return const Center(child: Text('No Pokémons found.'));
          }
          return ListView.builder(
            itemCount: data.results.length,
            itemBuilder: (context, index) {
              final pokemon = data.results[index];
              return PokemonListCardWidget(pokemonUrl: pokemon.url);
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
