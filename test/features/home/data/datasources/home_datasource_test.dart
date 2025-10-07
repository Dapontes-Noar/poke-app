import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_app/core/errors/pokemon_exceptions.dart';
import 'package:poke_app/core/network/dio_client.dart';
import 'package:poke_app/features/home/data/datasources/home_datasource.dart';
import 'package:poke_app/features/home/data/models/all_pokemons_response.dart';
import 'package:poke_app/features/home/data/models/all_types_response.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/data/models/pokemons_by_type_response.dart';

import '../../../../core/fixtures/test_utilities.dart';
import 'home_datasource_test.mocks.dart';

@GenerateMocks([DioClient])
void main() {
  late MockDioClient mockDioClient;
  late HomeDatasource homeDatasource;

  setUp(() {
    mockDioClient = MockDioClient();
    homeDatasource = HomeDatasourceImpl(mockDioClient);
  });

  group('getAllPokemons tests', () {
    test('return data when getAllPokemons sucess', () async {
      final dataResponse = jsonDecode(getFixture('all_Pokemons.json'));
      final expectedResponse = AllPokemonsResponse.fromJson(dataResponse);
      when(
        mockDioClient.get(
          'pokemon/',
          queryParameters: null,
          fromJson: anyNamed('fromJson'),
        ),
      ).thenAnswer((_) async => expectedResponse);

      try {
        await homeDatasource.getAllPokemons();
      } catch (e) {
        expect(e, isA<AllPokemonsResponse>());
      }
    });
    test('throws Exception on DioException', () async {
      when(
        mockDioClient.get(
          'pokemon/',
          queryParameters: null,
          fromJson: anyNamed('fromJson'),
        ),
      ).thenThrow(DioException(requestOptions: RequestOptions(path: '')));
      try {
        await homeDatasource.getAllPokemons();
      } catch (e) {
        expect(e, isA<PokemonNetworkException>());
      }
    });
    test('throws Exception on generic Exception', () async {
      when(
        mockDioClient.get(
          'pokemon/',
          queryParameters: null,
          fromJson: anyNamed('fromJson'),
        ),
      ).thenThrow(Exception('Generic error'));
      try {
        await homeDatasource.getAllPokemons();
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
  });
  group('getPokemonDetail tests', () {
    test('return data when getPokemonDetail success', () async {
      final dataResponse = jsonDecode(getFixture('pokemon_details.json'));
      final expectedResponse = PokemonDetailResponse.fromJson(dataResponse);
      when(
        mockDioClient.get('pokemon/1', fromJson: anyNamed('fromJson')),
      ).thenAnswer((_) async => expectedResponse);
      final result = await homeDatasource.getPokemonDetail('1');
      expect(result, isA<PokemonDetailResponse>());
      expect(result, expectedResponse);
    });
    test('throws Exception on DioException', () async {
      when(
        mockDioClient.get('pokemon/1', fromJson: anyNamed('fromJson')),
      ).thenThrow(DioException(requestOptions: RequestOptions(path: '')));
      expect(
        () => homeDatasource.getPokemonDetail('1'),
        throwsA(isA<PokemonNetworkException>()),
      );
    });
    test('throws Exception on generic Exception', () async {
      when(
        mockDioClient.get('pokemon/1', fromJson: anyNamed('fromJson')),
      ).thenThrow(Exception('Generic error'));
      expect(
        () => homeDatasource.getPokemonDetail('1'),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('getAllTypes tests', () {
    test('return data when getAllTypes success', () async {
      final dataResponse = jsonDecode(getFixture('pokemon_all_types.json'));
      final expectedResponse = AllTypesResponse.fromJson(dataResponse);
      when(
        mockDioClient.get('type/', fromJson: anyNamed('fromJson')),
      ).thenAnswer((_) async => expectedResponse);
      final result = await homeDatasource.getAllTypes();
      expect(result, isA<AllTypesResponse>());
      expect(result, expectedResponse);
    });
    test('throws Exception on DioException', () async {
      when(
        mockDioClient.get('type/', fromJson: anyNamed('fromJson')),
      ).thenThrow(DioException(requestOptions: RequestOptions(path: '')));
      expect(
        () => homeDatasource.getAllTypes(),
        throwsA(isA<PokemonNetworkException>()),
      );
    });
    test('throws Exception on generic Exception', () async {
      when(
        mockDioClient.get('type/', fromJson: anyNamed('fromJson')),
      ).thenThrow(Exception('Generic error'));
      expect(() => homeDatasource.getAllTypes(), throwsA(isA<Exception>()));
    });
  });

  group('getPokemonsByType tests', () {
    test('return data when getPokemonsByType success', () async {
      final dataResponse = jsonDecode(getFixture('pokemon_grass_type.json'));
      final expectedResponse = PokemonsByTypeResponse.fromJson(dataResponse);
      when(
        mockDioClient.get('type/grass', fromJson: anyNamed('fromJson')),
      ).thenAnswer((_) async => expectedResponse);
      final result = await homeDatasource.getPokemonsByType('grass');
      expect(result, isA<PokemonsByTypeResponse>());
      expect(result, expectedResponse);
    });
    test('throws Exception on DioException', () async {
      when(
        mockDioClient.get('type/grass', fromJson: anyNamed('fromJson')),
      ).thenThrow(DioException(requestOptions: RequestOptions(path: '')));
      expect(
        () => homeDatasource.getPokemonsByType('grass'),
        throwsA(isA<PokemonNetworkException>()),
      );
    });
    test('throws Exception on generic Exception', () async {
      when(
        mockDioClient.get('type/grass', fromJson: anyNamed('fromJson')),
      ).thenThrow(Exception('Generic error'));
      expect(
        () => homeDatasource.getPokemonsByType('grass'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
