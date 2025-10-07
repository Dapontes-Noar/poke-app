import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';
import 'package:poke_app/features/home/presentation/notifiers/poke_details_notifier.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/domain/usecases/get_pokemon_detail_usecase.dart';

import '../../../../core/constants/test_constants.dart';
import '../../../../core/fixtures/test_utilities.dart';
import 'poke_details_notifier_test.mocks.dart';

@GenerateMocks([GetPokemonDetailUsecase])
void main() {
  late ProviderContainer container;
  late MockGetPokemonDetailUsecase mockUsecase;

  setUp(() {
    mockUsecase = MockGetPokemonDetailUsecase();
    container = ProviderContainer(
      overrides: [
        getPokemonDetailUsecaseProvider.overrideWithValue(mockUsecase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('build returns PokemonDetailResponse for given name', () async {
    final data = jsonDecode(getFixture('pokemon_details.json'));
    final mockResponse = PokemonDetailResponse.fromJson(data);
    when(
      mockUsecase(TestConstants.pokeName),
    ).thenAnswer((_) async => mockResponse);
    final notifier = container.read(
      pokeDetailsProvider(TestConstants.pokeName).notifier,
    );
    final result = await notifier.build(TestConstants.pokeName);
    expect(result, isA<PokemonDetailResponse>());
    expect(result, mockResponse);
  });
}
