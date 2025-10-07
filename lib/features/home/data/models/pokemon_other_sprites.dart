// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_other_sprites.freezed.dart';

part 'pokemon_other_sprites.g.dart';

@freezed
abstract class PokemonOtherSprites with _$PokemonOtherSprites {
  const factory PokemonOtherSprites({
    @JsonKey(name: 'dream_world') SpriteResponse? dreamWorld,
  }) = _PokemonOtherSprites;

  factory PokemonOtherSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonOtherSpritesFromJson(json);
}

@freezed
abstract class SpriteResponse with _$SpriteResponse {
  const factory SpriteResponse({
    @JsonKey(name: 'front_default') String? frontDefault
  }) = _SpriteResponse;
  factory SpriteResponse.fromJson(Map<String, dynamic> json) =>
      _$SpriteResponseFromJson(json);
}