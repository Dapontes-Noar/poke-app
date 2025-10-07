import 'package:flutter/foundation.dart';
import 'package:poke_app/core/errors/error_messages.dart';
import 'package:poke_app/features/detail/data/datasources/pokemon_details_datasource.dart';
import 'package:poke_app/features/detail/data/models/pokemon_species_response.dart';
import 'package:poke_app/features/detail/data/models/pokemon_type_response.dart';
import 'package:poke_app/features/detail/domain/repositories/pokemon_details_repository.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_details_repository_impl.g.dart';

/// Implementation of [PokemonDetailsRepository] for fetching Pokémon species data from the API.
class PokemonDetailsRepositoryImpl implements PokemonDetailsRepository {
  final PokemonDetailsDatasource _datasource;

  PokemonDetailsRepositoryImpl(this._datasource);

  /// Fetches the Pokémon species data for the given [idOrName].
  /// Throws an [Exception] with a user-friendly error message if the request fails.
  @override
  Future<PokemonSpeciesResponse> getPokemonSpecies(String idOrName) async {
    try {
      return await _datasource.getPokemonSpecies(idOrName);
    } on DioException catch (e, st) {
      debugPrint('Network error in getPokemonSpecies $e, $st');
      throw Exception(ErrorMessages.networkError);
    } catch (e, st) {
      debugPrint('API error in getPokemonSpecies $e, $st');
      throw Exception(ErrorMessages.fetchPokemonsFailed);
    }
  }

  /// Fetches the Pokémon type data for the given [idOrName].
  /// Throws an [Exception] with a user-friendly error message if the request fails.
  @override
  Future<PokemonTypeResponse> getPokemonType(String idOrName) async {
    try {
      return await _datasource.getPokemonType(idOrName);
    } on DioException catch (e, st) {
      debugPrint('Network error in getPokemonType $e, $st');
      throw Exception('Network error: $e');
    } catch (e, st) {
      debugPrint('API error in getPokemonType $e, $st');
      throw Exception('API error: $e');
    }
  }
}

/// Riverpod provider for [PokemonDetailsRepository].
@Riverpod(keepAlive: true)
PokemonDetailsRepository pokemonDetailsRepository(Ref ref) {
  final datasource = ref.watch(pokemonDetailsDatasourceProvider);
  return PokemonDetailsRepositoryImpl(datasource);
}
