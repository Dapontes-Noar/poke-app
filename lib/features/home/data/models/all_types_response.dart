import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_app/features/home/data/models/pokemon_type_response.dart';

part 'all_types_response.freezed.dart';

part 'all_types_response.g.dart';

@freezed
abstract class AllTypesResponse with _$AllTypesResponse {
  const factory AllTypesResponse({
    required int count,
    required String? next,
    required String? previous,
    required List<TypeInfoResponse> results,
  }) = _AllTypesResponse;

  factory AllTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$AllTypesResponseFromJson(json);
}
