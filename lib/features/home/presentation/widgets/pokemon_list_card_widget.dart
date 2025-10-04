import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/presentation/notifiers/pokemon_details_notifier.dart';

class PokemonListCardWidget extends ConsumerWidget {
  final String pokemonUrl;

  const PokemonListCardWidget({super.key, required this.pokemonUrl});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonDetailAsync = ref.watch(pokemonDetailsProvider(pokemonUrl));
    return pokemonDetailAsync.when(
      data: (PokemonDetailResponse pokemon) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            leading: pokemon.sprites.frontDefault != null
                ? Image.network(
                    pokemon.sprites.frontDefault!,
                    width: 56,
                    height: 56,
                    fit: BoxFit.contain,
                  )
                : const SizedBox(width: 56, height: 56),
            title: Text(
              pokemon.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('ID: ${pokemon.id}'),
            onTap: () {},
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) =>
          ListTile(title: Text('Error loading Pokémon: $error')),
    );
  }
}
