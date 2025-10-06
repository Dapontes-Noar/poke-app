import 'package:dio/dio.dart';
import 'package:poke_app/core/errors/error_messages.dart';
import 'package:poke_app/core/di/di_providers.dart';
import 'package:poke_app/core/errors/pokemon_exceptions.dart';
import 'package:poke_app/core/network/dio_client.dart';
import 'package:poke_app/core/errors/logging.dart';
import 'package:poke_app/features/home/data/models/all_pokemons_response.dart';
import 'package:poke_app/features/home/data/models/all_types_response.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/data/models/pokemons_by_type_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_datasource.g.dart';

/// Data source for fetching Pokemons from the API.
abstract class HomeDatasource {
  /// Fetches all Pokemons from the API.
  /// [queryParameters] can be used for pagination or filtering.
  /// Throws a [DioException] or [Exception] if the request fails.
  Future<AllPokemonsResponse> getAllPokemons({
    Map<String, dynamic>? queryParameters,
  });

  ///  Fetchess the detail of a single Pokemon by [nameOrId].
  /// Throws a [DioException] or [Exception] if the request fails.
  Future<PokemonDetailResponse> getPokemonDetail(String nameOrId);

  /// Fetches all types from the API.
  /// Throws a [DioException] or [Exception] if the request fails.
  Future<AllTypesResponse> getAllTypes();

  /// Fetches all pokemons of a specific type by [name].
  /// Throws a [DioException] or [Exception] if the request fails.
  Future<PokemonsByTypeResponse> getPokemonsByType(String name);
}

class HomeDatasourceImpl implements HomeDatasource {
  final DioClient _dioClient;

  HomeDatasourceImpl(this._dioClient);

  /// Fetches all Pokemons from the API.
  /// Throws a [DioException] or [Exception] if the request fails.
  @override
  Future<AllPokemonsResponse> getAllPokemons({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dioClient.get<AllPokemonsResponse>(
        'pokemon/',
        queryParameters: queryParameters,
        fromJson: (data) => AllPokemonsResponse.fromJson(data),
      );
    } on DioException catch (dioError, st) {
      appLogger.severe('Network error in getAllPokemons', dioError, st);
      throw PokemonNetworkException(
        ErrorMessages.networkError,
        originalError: dioError,
        stackTrace: st,
      );
    } catch (e, st) {
      appLogger.severe('API error in getAllPokemons', e, st);
      throw PokemonApiException(
        ErrorMessages.fetchPokemonsFailed,
        originalError: e,
        stackTrace: st,
      );
    }
  }

  /// Fetches the detail of a single Pokemon by [nameOrId].
  /// Throws a [DioException] or [Exception] if the request fails.
  @override
  Future<PokemonDetailResponse> getPokemonDetail(String nameOrId) async {
    try {
      return await _dioClient.get<PokemonDetailResponse>(
        'pokemon/$nameOrId',
        fromJson: (data) => PokemonDetailResponse.fromJson(data),
      );
    } on DioException catch (dioError, st) {
      appLogger.severe('Network error in getPokemonDetail', dioError, st);
      throw PokemonNetworkException(
        ErrorMessages.networkError,
        originalError: dioError,
        stackTrace: st,
      );
    } catch (e, st) {
      appLogger.severe('API error in getPokemonDetail', e, st);
      throw PokemonApiException(
        ErrorMessages.fetchPokemonDetailFailed,
        originalError: e,
        stackTrace: st,
      );
    }
  }

  /// Fetches all types from the API.
  /// Throws a [DioException] or [Exception] if the request fails.
  @override
  Future<AllTypesResponse> getAllTypes() async {
    try {
      return await _dioClient.get<AllTypesResponse>(
        'type/',
        fromJson: (data) => AllTypesResponse.fromJson(data),
      );
    } on DioException catch (dioError, st) {
      appLogger.severe('Network error in getAllTypes', dioError, st);
      throw PokemonNetworkException(
        ErrorMessages.networkError,
        originalError: dioError,
        stackTrace: st,
      );
    } catch (e, st) {
      appLogger.severe('API error in getAllTypes', e, st);
      throw PokemonApiException(
        ErrorMessages.fetchTypesFailed,
        originalError: e,
        stackTrace: st,
      );
    }
  }

  /// Fetches all pokemons of a specific type by [name].
  /// Throws a [DioException] or [Exception] if the request fails.
  @override
  Future<PokemonsByTypeResponse> getPokemonsByType(String name) async {
    try {
      return await _dioClient.get<PokemonsByTypeResponse>(
        'type/$name',
        fromJson: (data) => PokemonsByTypeResponse.fromJson(data),
      );
    } on DioException catch (dioError, st) {
      appLogger.severe('Network error in getPokemonsByType', dioError, st);
      throw PokemonNetworkException(
        ErrorMessages.networkError,
        originalError: dioError,
        stackTrace: st,
      );
    } catch (e, st) {
      appLogger.severe('API error in getPokemonsByType', e, st);
      throw PokemonApiException(
        ErrorMessages.fetchPokemonsByTypeFailed,
        originalError: e,
        stackTrace: st,
      );
    }
  }
}

@Riverpod(keepAlive: true)
HomeDatasource homeDatasource(Ref ref) {
  final dioClient = ref.watch(dioClientProvider);
  return HomeDatasourceImpl(dioClient);
}
