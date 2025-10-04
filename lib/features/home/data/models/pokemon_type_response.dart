import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_type_response.freezed.dart';

part 'pokemon_type_response.g.dart';

@freezed
abstract class PokemonTypeResponse with _$PokemonTypeResponse {
  const factory PokemonTypeResponse({
    required int slot,
    required TypeInfoResponse type,
  }) = _PokemonTypeResponse;

  factory PokemonTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeResponseFromJson(json);
}

@freezed
abstract class TypeInfoResponse with _$TypeInfoResponse {
  const factory TypeInfoResponse({required String name, required String url}) =
      _TypeInfoResponse;

  factory TypeInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$TypeInfoResponseFromJson(json);
}
