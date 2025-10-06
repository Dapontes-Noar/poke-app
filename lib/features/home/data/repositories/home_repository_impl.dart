import 'package:dio/dio.dart';
import 'package:poke_app/features/home/data/datasources/home_datasource.dart';
import 'package:poke_app/features/home/data/models/all_pokemons_response.dart';
import 'package:poke_app/features/home/data/models/all_types_response.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
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
        throw Exception('No Pokemons found');
      }
    } on DioException catch (dioError) {
      throw Exception('Network error: \\${dioError.message}');
    } catch (e) {
      throw Exception('Failed to fetch Pokemons: \\${e.toString()}');
    }
  }

  /// Fetches the details of a specific Pokemon by its name or ID.
  /// Throws an [Exception] if the Pokemon is not found or if the request fails.
  @override
  Future<PokemonDetailResponse> getPokemonDetail(String nameOrId) async {
    try {
      return await _homeDatasource.getPokemonDetail(nameOrId);
    } on DioException catch (dioError) {
      throw Exception('Network error: \\${dioError.message}');
    } catch (e) {
      throw Exception('Failed to fetch Pokemon detail: \\${e.toString()}');
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
        throw Exception('No types found');
      }
    } on DioException catch (dioError) {
      throw Exception('Network error: \\${dioError.message}');
    } catch (e) {
      throw Exception('Failed to fetch types: \\${e.toString()}');
    }
  }
}

/// Riverpod provider for [HomeRepository].
@Riverpod(keepAlive: true)
HomeRepository homeRepository(Ref ref) {
  final datasource = ref.watch(homeDatasourceProvider);
  return HomeRepositoryImpl(datasource);
}
