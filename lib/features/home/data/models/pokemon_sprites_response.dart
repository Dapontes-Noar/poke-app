import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_sprites_response.freezed.dart';
part 'pokemon_sprites_response.g.dart';

@freezed
abstract class PokemonSpritesResponse with _$PokemonSpritesResponse {
  const factory PokemonSpritesResponse({
    @JsonKey(name: 'front_default') String? frontDefault,
    @JsonKey(name: 'back_default') String? backDefault,
    @JsonKey(name: 'front_shiny') String? frontShiny,
    @JsonKey(name: 'back_shiny') String? backShiny,
  }) = _PokemonSpritesResponse;

  factory PokemonSpritesResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesResponseFromJson(json);
}
