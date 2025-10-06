import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_app/features/home/data/models/all_pokemons_response.dart';
import 'package:poke_app/features/home/domain/usecases/filter_pokemons_by_types_usecase.dart';
import 'package:poke_app/features/home/domain/usecases/get_all_pokemon_usecase.dart';
import 'package:poke_app/features/home/presentation/notifiers/filter_types_notifier.dart';

/// Notifier for managing the state of all Pokemons in the home screen.
class HomeNotifier extends AsyncNotifier<AllPokemonsResponse> {

  Future<void> updateAllPokemons() async {
    final filterProvider = ref.read(filterTypesProvider);
    if (filterProvider.value?.selectedTypes != null &&
        filterProvider.value!.selectedTypes.isNotEmpty) {
      await fetchPokemonsByFilter(filterProvider.value?.selectedTypes ?? {});
      return;
    } else {
      await fetchAllPokemons();
    }
  }

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

  Future<void> fetchPokemonsByFilter(Set<String> types) async {
    state = const AsyncValue.loading();
    final filterPokemonsByTypes = ref.read(getFilterPokemonByTypesProvider);
    try {
      final result = await filterPokemonsByTypes(types);
      state = AsyncValue.data(
        AllPokemonsResponse(
          count: result.length,
          results: result.toList(),
          next: null,
          previous: null,
        ),
      );
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
