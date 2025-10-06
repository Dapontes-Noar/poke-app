import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:poke_app/features/home/domain/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_pokemon_detail_usecase.g.dart';

/// Use case for fetching a single Pokémon's detail from the repository.
///
/// This class encapsulates the logic to retrieve the details of a specific Pokémon
/// by its name or ID from the data source via the repository. It throws an exception
/// if the operation fails.
class GetPokemonDetailUsecase {
  /// The repository used to fetch Pokémon details.
  final HomeRepository _repository;

  /// Creates a [GetPokemonDetailUsecase] with the given [HomeRepository].
  GetPokemonDetailUsecase(this._repository);

  /// Fetches a Pokémon's detail by [nameOrId].
  ///
  /// Returns a [PokemonDetailResponse] containing the Pokémon's details.
  /// Throws an [Exception] if the fetch operation fails.
  Future<PokemonDetailResponse> call(String name) async {
    return await _repository.getPokemonDetail(name);
  }
}

/// Riverpod provider for [GetPokemonDetailUsecase].
///
/// Provides an instance of [GetPokemonDetailUsecase] using the [homeRepositoryProvider].
@riverpod
GetPokemonDetailUsecase getPokemonDetailUsecase(Ref ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return GetPokemonDetailUsecase(repository);
}
