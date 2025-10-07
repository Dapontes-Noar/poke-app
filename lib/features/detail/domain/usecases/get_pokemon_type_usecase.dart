import 'package:poke_app/features/detail/data/models/pokemon_type_response.dart';
import 'package:poke_app/features/detail/data/repositories/pokemon_details_repository_impl.dart';
import 'package:poke_app/features/detail/domain/repositories/pokemon_details_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_pokemon_type_usecase.g.dart';

/// Use case for fetching Pokémon type data by id or name.
class GetPokemonTypeUseCase {
  final PokemonDetailsRepository repository;

  GetPokemonTypeUseCase(this.repository);

  /// Fetches Pokémon type data for the given [idOrName].
  Future<PokemonTypeResponse> call(String idOrName) {
    return repository.getPokemonType(idOrName);
  }
}

@riverpod
GetPokemonTypeUseCase getPokemonTypeUseCase(Ref ref) {
  final repository = ref.watch(pokemonDetailsRepositoryProvider);
  return GetPokemonTypeUseCase(repository);
}
