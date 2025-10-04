import 'package:dio/dio.dart';
import 'package:poke_app/core/di/di_providers.dart';
import 'package:poke_app/core/network/dio_client.dart';
import 'package:poke_app/features/home/data/models/all_pokemons_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Data source for fetching Pokemons from the API.
abstract class HomeDatasource {
  /// Fetches all Pokemons from the API.
  /// [queryParameters] can be used for pagination or filtering.
  /// Throws a [DioException] or [Exception] if the request fails.
  Future<AllPokemonsResponse> getAllPokemons({
    Map<String, dynamic>? queryParameters,
  });
}

class HomeDatasourceImpl implements HomeDatasource {
  final DioClient _dioClient;
  static const String _endpoint = 'pokemon/';

  HomeDatasourceImpl(this._dioClient);

  /// Fetches all Pokemons from the API.
  /// Throws a [DioException] or [Exception] if the request fails.
  @override
  Future<AllPokemonsResponse> getAllPokemons({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dioClient.get<AllPokemonsResponse>(
        _endpoint,
        queryParameters: queryParameters,
        fromJson: (data) => AllPokemonsResponse.fromJson(data),
      );
    } on DioException catch (dioError) {
      // Optionally log dioError
      throw Exception('Network error: \\${dioError.message}');
    } catch (e) {
      // Optionally log the error
      throw Exception('Failed to fetch Pokemons: \\${e.toString()}');
    }
  }
}

@riverpod
HomeDatasource homeDatasource(Ref ref) {
  final dioClient = ref.watch(dioClientProvider);
  return HomeDatasourceImpl(dioClient);
}
