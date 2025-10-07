import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_app/features/home/data/models/all_types_response.dart';
import 'package:riverpod/riverpod.dart';
import 'package:poke_app/features/home/domain/usecases/get_all_types_usecase.dart';
import 'package:poke_app/features/home/presentation/notifiers/filter_types_notifier.dart';

import '../../../../core/fixtures/test_utilities.dart';
import 'filter_types_notifier_test.mocks.dart';

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

@GenerateMocks([GetAllTypesUseCase])
void main() {
  late ProviderContainer container;
  late MockGetAllTypesUseCase mockUseCase;
  final data = jsonDecode(getFixture('pokemon_all_types.json'));
  final mockResponse = AllTypesResponse.fromJson(data);

  setUp(() {
    mockUseCase = MockGetAllTypesUseCase();
    container = ProviderContainer(
      overrides: [getAllTypesUseCaseProvider.overrideWithValue(mockUseCase)],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('FilterTypesNotifier', () {
    test('build initializes with all types and empty selected set', () async {
      when(mockUseCase.call()).thenAnswer((_) async => mockResponse);

      final state = await container.read(filterTypesProvider.future);

      expect(state.allTypesResponse, equals(mockResponse));
      expect(state.selectedTypes, isEmpty);
    });

    test('toggleTypeSelection adds and removes correctly', () async {
      when(mockUseCase.call()).thenAnswer((_) async => mockResponse);
      final notifier = container.read(filterTypesProvider.notifier);
      await container.read(filterTypesProvider.future);

      notifier.toggleTypeSelection('fire');
      expect(notifier.isSelected('fire'), true);

      notifier.toggleTypeSelection('fire');
      expect(notifier.isSelected('fire'), false);
    });

    test('applySelection updates state and clears temporary types', () async {
      when(mockUseCase.call()).thenAnswer((_) async => mockResponse);
      final notifier = container.read(filterTypesProvider.notifier);
      await container.read(filterTypesProvider.future);

      notifier.toggleTypeSelection('grass');
      notifier.applySelection();

      final state = notifier.state.value!;
      expect(state.selectedTypes.contains('grass'), true);
      expect(notifier.isSelected('grass'), false); // cleared temporary set
    });

    test('unifySelectedTypes merges selected into temporary', () async {
      when(mockUseCase.call()).thenAnswer((_) async => mockResponse);
      final notifier = container.read(filterTypesProvider.notifier);
      await container.read(filterTypesProvider.future);

      // simulate applied selection
      notifier.toggleTypeSelection('fire');
      notifier.applySelection();

      // state now has 'fire'
      notifier.unifySelectedTypes();
      expect(notifier.isSelected('fire'), true);
    });

    test('cancelSelection clears temporary selections', () async {
      when(mockUseCase.call()).thenAnswer((_) async => mockResponse);
      final notifier = container.read(filterTypesProvider.notifier);
      await container.read(filterTypesProvider.future);

      notifier.toggleTypeSelection('water');
      expect(notifier.isSelected('water'), true);

      notifier.cancelSelection();
      expect(notifier.isSelected('water'), false);
    });

    test('cleanTemporaryTypes clears the temporary set', () async {
      when(mockUseCase.call()).thenAnswer((_) async => mockResponse);
      final notifier = container.read(filterTypesProvider.notifier);
      await container.read(filterTypesProvider.future);

      notifier.toggleTypeSelection('grass');
      notifier.cleanTemporaryTypes();
      expect(notifier.isSelected('grass'), false);
    });
  });
}
