import 'package:poke_app/features/detail/data/models/pokemon_species_response.dart';
import 'package:poke_app/features/detail/data/repositories/pokemon_details_repository_impl.dart';
import 'package:poke_app/features/detail/domain/repositories/pokemon_details_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_pokemon_species_usecase.g.dart';

/// Use case for fetching Pokémon species data by id or name.
class GetPokemonSpeciesUseCase {
  final PokemonDetailsRepository repository;

  GetPokemonSpeciesUseCase(this.repository);

  /// Fetches Pokémon species data for the given [idOrName].
  Future<PokemonSpeciesResponse> call(String idOrName) {
    return repository.getPokemonSpecies(idOrName);
  }
}

/// Riverpod provider for [GetPokemonSpeciesUseCase].
@riverpod
GetPokemonSpeciesUseCase getPokemonSpeciesUseCase(Ref ref) {
  final repository = ref.watch(pokemonDetailsRepositoryProvider);
  return GetPokemonSpeciesUseCase(repository);
}
