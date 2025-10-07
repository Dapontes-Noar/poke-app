import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_app/features/home/data/models/all_types_response.dart';
import 'package:poke_app/features/home/data/models/pokemon_response.dart';
import 'package:poke_app/features/home/data/models/pokemons_by_type_response.dart';
import 'package:riverpod/riverpod.dart';
import 'package:poke_app/features/home/data/models/all_pokemons_response.dart';
import 'package:poke_app/features/home/domain/usecases/filter_pokemons_by_types_usecase.dart';
import 'package:poke_app/features/home/domain/usecases/get_all_pokemon_usecase.dart';
import 'package:poke_app/features/home/presentation/notifiers/home_notifier.dart';

import '../../../../core/fixtures/test_utilities.dart';
import 'home_notifier_test.mocks.dart';

@GenerateMocks([GetAllPokemonUsecase, FilterPokemonsByTypesUsecase])
void main() {
  late ProviderContainer container;
  late MockGetAllPokemonUsecase mockGetAllPokemons;
  late MockFilterPokemonsByTypesUsecase mockFilterByTypes;
  final allPokemonsData = jsonDecode(getFixture('all_Pokemons.json'));
  final fakePokemons = AllPokemonsResponse.fromJson(allPokemonsData);
  final allTypesData = jsonDecode(getFixture('pokemon_all_types.json'));
  final allTypesResponse = AllTypesResponse.fromJson(allTypesData);
  final filterTypesDataResponse = jsonDecode(
    getFixture('pokemon_grass_type.json'),
  );
  final mockFilterTypesDataResponse = PokemonsByTypeResponse.fromJson(
    filterTypesDataResponse,
  );

  setUp(() {
    mockGetAllPokemons = MockGetAllPokemonUsecase();
    mockFilterByTypes = MockFilterPokemonsByTypesUsecase();

    container = ProviderContainer(
      overrides: [
        getAllPokemonUsecaseProvider.overrideWithValue(mockGetAllPokemons),
        getFilterPokemonByTypesProvider.overrideWithValue(mockFilterByTypes),
      ],
    );
  });

  tearDown(() => container.dispose());

  group('HomeNotifier', () {
    test('build initializes with data from getAllPokemonUsecase', () async {
      // arrange
      when(mockGetAllPokemons.call()).thenAnswer((_) async => fakePokemons);

      // act
      final result = await container.read(
        homeNotifierProvider.future,
      ); // triggers build

      // assert
      expect(result, equals(fakePokemons));
      verify(mockGetAllPokemons.call()).called(1);
    });

    test('fetchAllPokemons updates state with data', () async {
      when(mockGetAllPokemons.call()).thenAnswer((_) async => fakePokemons);
      final notifier = container.read(homeNotifierProvider.notifier);

      await notifier.fetchAllPokemons();

      final state = notifier.state;
      expect(state.value, equals(fakePokemons));
      expect(state.isLoading, false);
    });

    test('fetchAllPokemons sets error state on exception', () async {
      when(mockGetAllPokemons.call()).thenThrow(Exception('network error'));
      final notifier = container.read(homeNotifierProvider.notifier);

      await notifier.fetchAllPokemons();

      expect(notifier.state.hasError, true);
      expect(notifier.state.error, isA<Exception>());
    });

    test('fetchPokemonsByFilter updates state with filtered data', () async {
      final Set<PokemonResponse> fakeFilterList = fakePokemons.results.toSet();
      when(mockFilterByTypes.call(any)).thenAnswer((_) async => fakeFilterList);

      final notifier = container.read(homeNotifierProvider.notifier);

      await notifier.fetchPokemonsByFilter({'grass'});

      final state = notifier.state.value!;
      expect(state.count, fakeFilterList.length);
      expect(state.results.first.name, fakeFilterList.first.name);
    });

    test('fetchPokemonsByFilter sets error state on exception', () async {
      when(mockFilterByTypes.call(any)).thenThrow(Exception('filter failed'));
      final notifier = container.read(homeNotifierProvider.notifier);

      await notifier.fetchPokemonsByFilter({'fire'});

      expect(notifier.state.hasError, true);
    });
  });
}
