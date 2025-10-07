import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_app/features/home/data/models/pokemons_by_type_response.dart';
import 'package:poke_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:poke_app/features/home/domain/usecases/filter_pokemons_by_types_usecase.dart';

import '../../../../core/constants/test_constants.dart';
import '../../../../core/fixtures/test_utilities.dart';
import 'filter_pokemons_by_types_usecase_test.mocks.dart';

@GenerateMocks([HomeRepositoryImpl])
void main() {
  late MockHomeRepositoryImpl mockHomeRepository;
  late FilterPokemonsByTypesUsecase usecase;

  setUp(() {
    mockHomeRepository = MockHomeRepositoryImpl();
    usecase = FilterPokemonsByTypesUsecase(mockHomeRepository);
  });

  group('call test', () {
    final dataResponse = jsonDecode(getFixture('pokemon_grass_type.json'));
    final expectedResponse = PokemonsByTypeResponse.fromJson(dataResponse);
    test('return empty if the list of types is empty', () {
      final List<String> types = [];
      expect(usecase.call(types), completion(isEmpty));
    });
    test(
      'return set of PokemonResponse when repository call is successful',
      () async {
        when(
          mockHomeRepository.getPokemonsByType(TestConstants.poketype),
        ).thenAnswer((_) async => expectedResponse);

        final result = await usecase.call([TestConstants.poketype]);
        expect(result, isA<Set>());
      },
    );
    test('combines and deduplicates pokemons from multiple types', () async {
      final dataGrass = jsonDecode(getFixture('pokemon_grass_type.json'));
      final dataOther = jsonDecode(getFixture('pokemon_grass_type.json'));
      // Simulate two types with overlapping results
      final responseGrass = PokemonsByTypeResponse.fromJson(dataGrass);
      final responseOther = PokemonsByTypeResponse.fromJson(dataOther);
      when(
        mockHomeRepository.getPokemonsByType('grass'),
      ).thenAnswer((_) async => responseGrass);
      when(
        mockHomeRepository.getPokemonsByType('other'),
      ).thenAnswer((_) async => responseOther);
      final result = await usecase.call(['grass', 'other']);
      // Should be a set, so no duplicates
      expect(
        result.length,
        responseGrass.pokemon.length,
      ); // since both responses are the same
      expect(result, isA<Set>());
    });

    test('throws Exception with error message if repository throws', () async {
      when(
        mockHomeRepository.getPokemonsByType(any),
      ).thenThrow(Exception('fail'));
      final types = ['grass'];

      try {
        await usecase.call(types);
      } catch (e) {
        expect(e, isA<Exception>());
      }
    });
  });
}
