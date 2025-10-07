import 'package:flutter/foundation.dart';
import 'package:poke_app/core/di/di_providers.dart';
import 'package:poke_app/core/errors/error_messages.dart';
import 'package:poke_app/core/errors/pokemon_exceptions.dart';
import 'package:poke_app/features/detail/data/models/pokemon_species_response.dart';
import 'package:poke_app/features/detail/data/models/pokemon_type_response.dart';
import 'package:poke_app/core/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_details_datasource.g.dart';

abstract class PokemonDetailsDatasource {
  Future<PokemonSpeciesResponse> getPokemonSpecies(String idOrName);
  Future<PokemonTypeResponse> getPokemonType(String idOrName);
}

class PokemonDetailsDatasourceImpl implements PokemonDetailsDatasource {
  final DioClient _dioClient;

  PokemonDetailsDatasourceImpl(this._dioClient);

  @override
  Future<PokemonSpeciesResponse> getPokemonSpecies(String idOrName) async {
    try {
      return await _dioClient.get<PokemonSpeciesResponse>(
        'pokemon-species/$idOrName',
        fromJson: (json) => PokemonSpeciesResponse.fromJson(json),
      );
    } on DioException catch (dioError, st) {
      debugPrint('Network error in getPokemonSpecies: $dioError, $st');
      throw PokemonNetworkException(
        ErrorMessages.networkError,
        originalError: dioError,
        stackTrace: st,
      );
    } catch (e, st) {
      throw PokemonApiException(
        ErrorMessages.fetchPokemonsByTypeFailed,
        originalError: e,
        stackTrace: st,
      );
    }
  }

  @override
  Future<PokemonTypeResponse> getPokemonType(String idOrName) async {
    try {
      return await _dioClient.get<PokemonTypeResponse>(
        'type/$idOrName',
        fromJson: (json) => PokemonTypeResponse.fromJson(json),
      );
    } on DioException catch (dioError, st) {
      debugPrint('Network error in getPokemonType: $dioError, $st');
      throw PokemonNetworkException(
        ErrorMessages.networkError,
        originalError: dioError,
        stackTrace: st,
      );
    } catch (e, st) {
      throw PokemonApiException(
        ErrorMessages.fetchPokemonsByTypeFailed,
        originalError: e,
        stackTrace: st,
      );
    }
  }
}

@Riverpod(keepAlive: true)
PokemonDetailsDatasource pokemonDetailsDatasource(Ref ref) {
  final dioClient = ref.watch(dioClientProvider);
  return PokemonDetailsDatasourceImpl(dioClient);
}
