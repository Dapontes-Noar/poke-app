import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_app/features/home/data/models/pokemon_ability_response.dart';
import 'package:poke_app/features/home/data/models/pokemon_type_response.dart';
import 'package:poke_app/features/home/data/models/pokemon_sprites_response.dart';

part 'pokemon_detail_response.freezed.dart';

part 'pokemon_detail_response.g.dart';

@freezed
abstract class PokemonDetailResponse with _$PokemonDetailResponse {
  const factory PokemonDetailResponse({
    required int id,
    required String name,
    required int height,
    required int weight,
    required List<PokemonAbilityResponse> abilities,
    required List<PokemonTypeResponse> types,
    required PokemonSpritesResponse sprites,
  }) = _PokemonDetailResponse;

  factory PokemonDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailResponseFromJson(json);
}
