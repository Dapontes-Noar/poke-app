import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_language_response.freezed.dart';

part 'pokemon_language_response.g.dart';

@freezed
abstract class PokemonLanguageResponse with _$PokemonLanguageResponse {
  const factory PokemonLanguageResponse({
    required String name,
    required String url,
  }) = _PokemonLanguageResponse;

  factory PokemonLanguageResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonLanguageResponseFromJson(json);
}
