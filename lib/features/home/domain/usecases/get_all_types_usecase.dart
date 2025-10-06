import 'package:poke_app/core/errors/error_messages.dart';
import 'package:poke_app/features/home/data/models/all_types_response.dart';
import 'package:poke_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:poke_app/features/home/domain/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_types_usecase.g.dart';

/// Use case for fetching all Pokémon types from the repository.
/// This class encapsulates the logic to retrieve all available Pokémon types
/// from the data source via the repository. It handles errors and throws a
/// standardized exception message if the operation fails.
class GetAllTypesUseCase {
  /// The repository used to fetch Pokémon types.
  final HomeRepository repository;

  /// Creates a [GetAllTypesUseCase] with the given [repository].
  GetAllTypesUseCase(this.repository);

  /// Fetches all Pokémon types.
  /// Returns an [AllTypesResponse] containing the list of types.
  /// Throws an [Exception] with a standardized error message if the fetch fails.
  Future<AllTypesResponse> call() async {
    try {
      return await repository.getAllTypes();
    } catch (e, st) {
      throw Exception('${ErrorMessages.getAllTypesUsecaseFailed}: $e\n$st');
    }
  }
}

/// Riverpod provider for [GetAllTypesUseCase].
@riverpod
GetAllTypesUseCase getAllTypesUseCase(Ref ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return GetAllTypesUseCase(repository);
}
