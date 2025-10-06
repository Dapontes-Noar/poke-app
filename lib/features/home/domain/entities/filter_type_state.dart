import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_app/features/home/data/models/all_types_response.dart';

part 'filter_type_state.freezed.dart';

@freezed
abstract class FilterTypesState with _$FilterTypesState {
  const factory FilterTypesState({
    AllTypesResponse? allTypesResponse,
    @Default({}) Set<String> selectedTypes,
  }) = _FilterTypesState;
}
