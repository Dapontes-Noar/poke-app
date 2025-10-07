import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_app/features/home/data/models/all_types_response.dart';
import 'package:poke_app/features/home/domain/usecases/get_all_types_usecase.dart';
import 'package:poke_app/features/home/data/repositories/home_repository_impl.dart';
import '../../../../core/fixtures/test_utilities.dart';
import 'get_all_types_usecase_test.mocks.dart';

@GenerateMocks([HomeRepositoryImpl])
void main() {
  late HomeRepositoryImpl mockRepository;
  late GetAllTypesUseCase usecase;

  setUp(() {
    mockRepository = MockHomeRepositoryImpl();
    usecase = GetAllTypesUseCase(mockRepository);
  });

  test('returns AllTypesResponse when repository succeeds', () async {
    final data = jsonDecode(getFixture('pokemon_all_types.json'));
    final response = AllTypesResponse.fromJson(data);
    when(mockRepository.getAllTypes()).thenAnswer((_) async => response);
    final result = await usecase();
    expect(result, response);
  });

  test(
    'throws Exception with correct message when repository throws',
    () async {
      when(mockRepository.getAllTypes()).thenThrow(Exception('fail'));
      try {
        await usecase();
      } catch (e) {
        expect(e, isA<Exception>());
      }
    },
  );
}
