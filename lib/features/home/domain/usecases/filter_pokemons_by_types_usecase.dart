import 'package:poke_app/core/errors/error_messages.dart';
import 'package:poke_app/features/home/data/models/pokemon_response.dart';
import 'package:poke_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:poke_app/features/home/domain/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_pokemons_by_types_usecase.g.dart';

/// Use case for filtering Pokémons by a set of type names.
///
/// This class encapsulates the logic to retrieve all Pokémons that match any of the given types
/// from the repository. It returns a set of unique Pokémon responses. If the types list is empty,
/// it returns an empty set. If any API call fails, it throws an exception with a standardized error message.
class FilterPokemonsByTypesUsecase {
  /// The repository used to fetch Pokémons by type.
  final HomeRepository _repository;

  /// Creates a [FilterPokemonsByTypesUsecase] with the given [HomeRepository].
  FilterPokemonsByTypesUsecase(this._repository);

  /// Filters Pokémons by the provided [types].
  /// Returns a set of unique [PokemonResponse] objects that match any of the given types.
  /// If [types] is empty, returns an empty set.
  /// If any API call fails, throws an [Exception] with a standardized error message and stack trace.
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
            pokemonsByTypeResponse.pokemon.map(
              (typeResponse) => typeResponse.pokemon,
            ),
          );
        }
      }
      return filteredPokemons;
    } catch (e, st) {
      throw Exception('${ErrorMessages.filterPokemonsByTypesFailed}: $e\n$st');
    }
  }
}

/// Riverpod provider for [FilterPokemonsByTypesUsecase].
@riverpod
FilterPokemonsByTypesUsecase getFilterPokemonByTypes(Ref ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return FilterPokemonsByTypesUsecase(repository);
}
