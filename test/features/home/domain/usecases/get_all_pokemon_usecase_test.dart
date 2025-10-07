import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_app/features/home/data/models/all_pokemons_response.dart';
import 'package:poke_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:poke_app/features/home/domain/usecases/get_all_pokemon_usecase.dart';
import '../../../../core/fixtures/test_utilities.dart';
import 'get_all_pokemon_usecase_test.mocks.dart';

@GenerateMocks([HomeRepositoryImpl])
void main() {
  late MockHomeRepositoryImpl mockRepository;
  late GetAllPokemonUsecase usecase;

  setUp(() {
    mockRepository = MockHomeRepositoryImpl();
    usecase = GetAllPokemonUsecase(mockRepository);
  });

  test('returns AllPokemonsResponse when repository succeeds', () async {
    final data = jsonDecode(getFixture('all_Pokemons.json'));
    final response = AllPokemonsResponse.fromJson(data);
    when(mockRepository.getAllPokemons()).thenAnswer((_) async => response);
    final result = await usecase();
    expect(result, response);
  });

  test(
    'throws Exception with correct message when repository throws',
    () async {
      when(mockRepository.getAllPokemons()).thenThrow(Exception('fail'));
      try {
        await usecase();
        fail('Should throw');
      } catch (e) {

        expect(e, isA<Exception>());
      }
    },
  );
}
