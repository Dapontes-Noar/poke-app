import 'package:poke_app/features/home/data/models/all_types_response.dart';
import 'package:poke_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:poke_app/features/home/domain/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_types_usecase.g.dart';

class GetAllTypesUseCase {
  final HomeRepository repository;

  GetAllTypesUseCase(this.repository);

  Future<AllTypesResponse> call() {
    return repository.getAllTypes();
  }
}

@riverpod
GetAllTypesUseCase getAllTypesUseCase(Ref ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return GetAllTypesUseCase(repository);
}
