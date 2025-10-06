import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:poke_app/core/errors/error_messages.dart';
import 'package:poke_app/features/home/data/datasources/home_datasource.dart';
import 'package:poke_app/features/home/data/models/all_pokemons_response.dart';
import 'package:poke_app/features/home/data/models/all_types_response.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/data/models/pokemons_by_type_response.dart';
import 'package:poke_app/features/home/domain/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository_impl.g.dart';

/// Implementation of [HomeRepository] for fetching Pokemons.
class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource _homeDatasource;

  HomeRepositoryImpl(this._homeDatasource);

  /// Fetches all Pokemons from the data source.
  /// Throws an [Exception] if no Pokemons are found or if the request fails.
  @override
  Future<AllPokemonsResponse> getAllPokemons({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final allPokemons = await _homeDatasource.getAllPokemons(
        queryParameters: queryParameters,
      );
      if (allPokemons.results.isNotEmpty) {
        return allPokemons;
      } else {
        debugPrint('No Pokemons found in getAllPokemons');
        throw Exception(ErrorMessages.noPokemonsFound);
      }
    } on DioException catch (dioError, st) {
      debugPrint('Network error in getAllPokemons $dioError, $st');
      throw Exception(ErrorMessages.networkError);
    } catch (e, st) {
      debugPrint('API error in getAllPokemons $e, $st');
      throw Exception(ErrorMessages.fetchPokemonsFailed);
    }
  }

  /// Fetches the details of a specific Pokemon by its name or ID.
  /// Throws an [Exception] if the Pokemon is not found or if the request fails.
  @override
  Future<PokemonDetailResponse> getPokemonDetail(String nameOrId) async {
    try {
      return await _homeDatasource.getPokemonDetail(nameOrId);
    } on DioException catch (dioError, st) {
      debugPrint('Network error in getPokemonDetail $dioError, $st');
      throw Exception(ErrorMessages.networkError);
    } catch (e, st) {
      debugPrint('API error in getPokemonDetail $e, $st');
      throw Exception(ErrorMessages.fetchPokemonDetailFailed);
    }
  }

  /// Fetches all Pokemon types from the data source.
  /// Throws an [Exception] if no types are found or if the request fails.
  @override
  Future<AllTypesResponse> getAllTypes() async {
    try {
      final allTypes = await _homeDatasource.getAllTypes();
      if (allTypes.results.isNotEmpty) {
        return allTypes;
      } else {
        debugPrint('No types found in getAllTypes');
        throw Exception(ErrorMessages.noTypesFound);
      }
    } on DioException catch (dioError, st) {
      debugPrint('Network error in getAllTypes $dioError, $st');
      throw Exception(ErrorMessages.networkError);
    } catch (e, st) {
      debugPrint('API error in getAllTypes $e, $st');
      throw Exception(ErrorMessages.fetchTypesFailed);
    }
  }

  /// Fetches all Pokemons of a specific type by its name.
  /// Throws an [Exception] if no Pokemons are found for the type or if the request fails.
  @override
  Future<PokemonsByTypeResponse> getPokemonsByType(String name) async {
    try {
      final pokemonsByType = await _homeDatasource.getPokemonsByType(name);
      if (pokemonsByType.pokemon.isNotEmpty) {
        return pokemonsByType;
      } else {
        debugPrint('No Pokemons found for type $name in getPokemonsByType');
        throw Exception(ErrorMessages.noPokemonsFoundForType);
      }
    } on DioException catch (dioError, st) {
      debugPrint('Network error in getPokemonsByType $dioError, $st');
      throw Exception(ErrorMessages.networkError);
    } catch (e, st) {
      debugPrint('API error in getPokemonsByType $e, $st');
      throw Exception(ErrorMessages.fetchPokemonsByTypeFailed);
    }
  }
}

/// Riverpod provider for [HomeRepository].
@Riverpod(keepAlive: true)
HomeRepository homeRepository(Ref ref) {
  final datasource = ref.watch(homeDatasourceProvider);
  return HomeRepositoryImpl(datasource);
}
