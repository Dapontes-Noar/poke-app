import 'package:poke_app/features/home/data/models/pokemon_response.dart';
import 'package:poke_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:poke_app/features/home/domain/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_pokemons_by_types_usecase.g.dart';

/// Use case to filter Pokemons by a set of type names.
/// Returns a set of unique PokemonResponse objects that match any of the given types.
class FilterPokemonsByTypesUsecase {
  final HomeRepository _repository;

  FilterPokemonsByTypesUsecase(this._repository);

  /// Filters Pokemons by the provided [types].
  /// Returns a set of unique PokemonResponse objects.
  /// If [types] is empty, returns an empty set.
  /// If any API call fails, throws an exception with details.
  Future<Set<PokemonResponse>> call(Iterable<String> types) async {
    final Set<PokemonResponse> filteredPokemons = {};
    if (types.isEmpty) return filteredPokemons;
    try {
      final results = await Future.wait(
        types.map((type) => _repository.getPokemonsByType(type)),
      );
      for (final pokemonsByTypeResponse in results) {
        if (pokemonsByTypeResponse.pokemon.isNotEmpty) {
          filteredPokemons.addAll(
            pokemonsByTypeResponse.pokemon.map((typeResponse) => typeResponse.pokemon),
          );
        }
      }
      return filteredPokemons;
    } catch (e, st) {
      throw Exception('Failed to filter Pokemons by types: $e\n$st');
    }
  }
}

@riverpod
FilterPokemonsByTypesUsecase getFilterPokemonByTypes(Ref ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return FilterPokemonsByTypesUsecase(repository);
}
