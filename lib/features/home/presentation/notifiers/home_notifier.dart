import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/features/home/data/models/all_pokemons_response.dart';
import 'package:poke_app/features/home/domain/usecases/get_all_pokemon_usecase.dart';

/// Notifier for managing the state of all Pokemons in the home screen.
class HomeNotifier extends AsyncNotifier<AllPokemonsResponse> {
  Future<void> fetchAllPokemons() async {
    state = const AsyncValue.loading();
    final getAllPokemons = ref.read(getAllPokemonUsecaseProvider);
    try {
      final result = await getAllPokemons();
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Called when the notifier is first created.
  @override
  FutureOr<AllPokemonsResponse> build() async {
    final getAllPokemons = ref.read(getAllPokemonUsecaseProvider);
    return await getAllPokemons();
  }
}

/// Riverpod provider for [HomeNotifier].
final homeNotifierProvider =
    AsyncNotifierProvider<HomeNotifier, AllPokemonsResponse>(HomeNotifier.new);
