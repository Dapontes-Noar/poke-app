import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_response.freezed.dart';

part 'pokemon_response.g.dart';

@freezed
abstract class PokemonResponse with _$PokemonResponse {
  const factory PokemonResponse({required String name, required String url}) =
      _PokemonResponse;

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);
}
