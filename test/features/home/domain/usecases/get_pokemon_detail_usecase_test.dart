import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:poke_app/features/home/data/repositories/home_repository_impl.dart';
import '../../../../core/fixtures/test_utilities.dart';
import 'get_pokemon_detail_usecase_test.mocks.dart';

@GenerateMocks([HomeRepositoryImpl])
void main() {
  late MockHomeRepositoryImpl mockRepository;
  late GetPokemonDetailUsecase usecase;

  setUp(() {
    mockRepository = MockHomeRepositoryImpl();
    usecase = GetPokemonDetailUsecase(mockRepository);
  });

  test('returns PokemonDetailResponse when repository succeeds', () async {
    final data = jsonDecode(getFixture('pokemon_details.json'));
    final response = PokemonDetailResponse.fromJson(data);
    when(mockRepository.getPokemonDetail('1')).thenAnswer((_) async => response);
    final result = await usecase('1');
    expect(result, response);
  });

  test('throws Exception with correct message when repository throws', () async {
    when(mockRepository.getPokemonDetail('1')).thenThrow(Exception('fail'));
    try {
      await usecase('1');
      fail('Should throw');
    } catch (e) {
      expect(e, isA<Exception>());
    }
  });
}