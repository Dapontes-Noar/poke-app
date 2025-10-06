import 'package:poke_app/features/home/domain/entities/filter_type_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:poke_app/features/home/domain/usecases/get_all_types_usecase.dart';

part 'filter_types_notifier.g.dart';

@Riverpod(keepAlive: true)
class FilterTypesNotifier extends _$FilterTypesNotifier {
  final Set<String> _temporarySelectedTypes = {};

  @override
  FutureOr<FilterTypesState> build() async {
    final useCase = ref.read(getAllTypesUseCaseProvider);
    final allTypesResponse = await useCase();
    return FilterTypesState(
      allTypesResponse: allTypesResponse,
      selectedTypes: {},
    );
  }

  void unifySelectedTypes() {
    if (state.value?.selectedTypes != null &&
        state.value!.selectedTypes.isNotEmpty) {
      _temporarySelectedTypes.addAll(state.value!.selectedTypes);
    }
  }

  void toggleTypeSelection(String type) {
    if (_temporarySelectedTypes.contains(type)) {
      _temporarySelectedTypes.remove(type);
    } else {
      _temporarySelectedTypes.add(type);
    }
  }

  void applySelection() {
    if (state.value != null) {
      state = AsyncData(
        state.value!.copyWith(
          selectedTypes: Set<String>.from(_temporarySelectedTypes),
        ),
      );
      _temporarySelectedTypes.clear();
    }
  }

  void cancelSelection() {
    _temporarySelectedTypes.clear();
  }

  bool isSelected(String type) {
    return _temporarySelectedTypes.contains(type);
  }

  void cleanTemporaryTypes() {
    _temporarySelectedTypes.clear();
  }
}
