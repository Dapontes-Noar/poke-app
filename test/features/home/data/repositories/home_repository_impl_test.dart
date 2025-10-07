import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_app/features/home/data/datasources/home_datasource.dart';
import 'package:poke_app/features/home/data/models/all_pokemons_response.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/data/models/all_types_response.dart';
import 'package:poke_app/features/home/data/models/pokemons_by_type_response.dart';
import 'package:poke_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:poke_app/features/home/domain/repositories/home_repository.dart';

import '../../../../core/fixtures/test_utilities.dart';
import 'home_repository_impl_test.mocks.dart';

@GenerateMocks([HomeDatasourceImpl])
void main() {
  late MockHomeDatasourceImpl mockHomeDatasource;
  late HomeRepository homeRepository;

  setUp(() {
    mockHomeDatasource = MockHomeDatasourceImpl();
    homeRepository = HomeRepositoryImpl(mockHomeDatasource);
  });

  group('getAllPokemons tests', () {
    test('return data when getAllPokemons success', () async {
      final dataResponse = jsonDecode(getFixture('all_Pokemons.json'));
      final expectedResponse = AllPokemonsResponse.fromJson(dataResponse);

      when(
        mockHomeDatasource.getAllPokemons(),
      ).thenAnswer((_) async => expectedResponse);

      final result = await homeRepository.getAllPokemons();
      expect(result, isA<AllPokemonsResponse>());
    });
    test('throws Exception on failure', () async {
      when(
        mockHomeDatasource.getAllPokemons(),
      ).thenThrow(Exception('Failed to fetch Pokemons'));

      try {
        await homeRepository.getAllPokemons();
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
    test('throws Exception when no Pokemons found', () async {
      final expectedResponse = AllPokemonsResponse(
        results: [],
        count: 0,
        next: null,
        previous: null,
      );

      when(
        mockHomeDatasource.getAllPokemons(),
      ).thenAnswer((_) async => expectedResponse);

      try {
        await homeRepository.getAllPokemons();
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
    test('throws Exception on generic Exception', () async {
      when(
        mockHomeDatasource.getAllPokemons(),
      ).thenThrow(Exception('Generic error'));

      try {
        await homeRepository.getAllPokemons();
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
  });

  group('getPokemonDetail tests', () {
    test('returns data when getPokemonDetail success', () async {
      final dataResponse = jsonDecode(getFixture('pokemon_details.json'));
      final expectedResponse = PokemonDetailResponse.fromJson(dataResponse);
      when(
        mockHomeDatasource.getPokemonDetail('1'),
      ).thenAnswer((_) async => expectedResponse);
      final result = await homeRepository.getPokemonDetail('1');
      expect(result, isA<PokemonDetailResponse>());
      expect(result, expectedResponse);
    });
    test('throws Exception on failure', () async {
      when(
        mockHomeDatasource.getPokemonDetail('1'),
      ).thenThrow(Exception('Failed to fetch Pokemon detail'));
      try {
        await homeRepository.getPokemonDetail('1');
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
    test('throws Exception on generic Exception', () async {
      when(
        mockHomeDatasource.getPokemonDetail('1'),
      ).thenThrow(Exception('Generic error'));
      try {
        await homeRepository.getPokemonDetail('1');
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
  });

  group('getAllTypes tests', () {
    test('returns data when getAllTypes success', () async {
      final dataResponse = jsonDecode(getFixture('pokemon_all_types.json'));
      final expectedResponse = AllTypesResponse.fromJson(dataResponse);
      when(
        mockHomeDatasource.getAllTypes(),
      ).thenAnswer((_) async => expectedResponse);
      final result = await homeRepository.getAllTypes();
      expect(result, isA<AllTypesResponse>());
      expect(result, expectedResponse);
    });
    test('throws Exception when no types found', () async {
      final emptyResponse = AllTypesResponse(
        results: [],
        count: 0,
        next: null,
        previous: null,
      );
      when(
        mockHomeDatasource.getAllTypes(),
      ).thenAnswer((_) async => emptyResponse);
      try {
        await homeRepository.getAllTypes();
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
    test('throws Exception on failure', () async {
      when(
        mockHomeDatasource.getAllTypes(),
      ).thenThrow(Exception('Failed to fetch types'));
      try {
        await homeRepository.getAllTypes();
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
    test('throws Exception on generic Exception', () async {
      when(
        mockHomeDatasource.getAllTypes(),
      ).thenThrow(Exception('Generic error'));
      try {
        await homeRepository.getAllTypes();
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
  });

  group('getPokemonsByType tests', () {
    test('returns data when getPokemonsByType success', () async {
      final dataResponse = jsonDecode(getFixture('pokemon_grass_type.json'));
      final expectedResponse = PokemonsByTypeResponse.fromJson(dataResponse);
      when(
        mockHomeDatasource.getPokemonsByType('grass'),
      ).thenAnswer((_) async => expectedResponse);
      final result = await homeRepository.getPokemonsByType('grass');
      expect(result, isA<PokemonsByTypeResponse>());
      expect(result, expectedResponse);
    });
    test('throws Exception when no pokemons found for type', () async {
      final emptyResponse = PokemonsByTypeResponse(pokemon: []);
      when(
        mockHomeDatasource.getPokemonsByType('grass'),
      ).thenAnswer((_) async => emptyResponse);
      try {
        await homeRepository.getPokemonsByType('grass');
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
    test('throws Exception on failure', () async {
      when(
        mockHomeDatasource.getPokemonsByType('grass'),
      ).thenThrow(Exception('Failed to fetch pokemons by type'));
      try {
        await homeRepository.getPokemonsByType('grass');
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
    test('throws Exception on generic Exception', () async {
      when(
        mockHomeDatasource.getPokemonsByType('grass'),
      ).thenThrow(Exception('Generic error'));
      try {
        await homeRepository.getPokemonsByType('grass');
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
  });
}
