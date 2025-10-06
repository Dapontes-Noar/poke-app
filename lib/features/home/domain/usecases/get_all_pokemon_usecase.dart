import 'package:poke_app/core/errors/error_messages.dart';
import 'package:poke_app/features/home/data/models/all_pokemons_response.dart';
import 'package:poke_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:poke_app/features/home/domain/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_pokemon_usecase.g.dart';

/// Use case for fetching all Pokemons.
class GetAllPokemonUsecase {
  final HomeRepository _repository;

  GetAllPokemonUsecase(this._repository);

  /// Executes the use case to fetch all Pokemons.
  /// Returns a [Future] that resolves to an [AllPokemonsResponse].
  /// Throws an [Exception] if the fetch operation fails.
  Future<AllPokemonsResponse> call() async {
    try {
      return await _repository.getAllPokemons();
    } catch (e, st) {
      throw Exception('${ErrorMessages.getAllPokemonsUsecaseFailed}: $e\n$st');
    }
  }
}

/// Riverpod provider for [GetAllPokemonUsecase].
@riverpod
GetAllPokemonUsecase getAllPokemonUsecase(Ref ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return GetAllPokemonUsecase(repository);
}
