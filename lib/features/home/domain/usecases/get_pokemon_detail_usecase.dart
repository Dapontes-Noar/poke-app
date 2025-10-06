import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:poke_app/features/home/domain/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_pokemon_detail_usecase.g.dart';

/// Use case for fetching a single Pokemon's detail.
class GetPokemonDetailUsecase {
  final HomeRepository _repository;

  GetPokemonDetailUsecase(this._repository);

  /// Executes the use case to fetch a Pokemon's detail by [nameOrId].
  /// Throws an [Exception] if the fetch operation fails.
  Future<PokemonDetailResponse> call(String name) async {
    return await _repository.getPokemonDetail(name);
  }
}

/// Riverpod provider for [GetPokemonDetailUsecase].
@riverpod
GetPokemonDetailUsecase getPokemonDetailUsecase(Ref ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return GetPokemonDetailUsecase(repository);
}
