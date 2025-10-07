import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_ability_response.freezed.dart';

part 'pokemon_ability_response.g.dart';

@freezed
abstract class PokemonAbilityResponse with _$PokemonAbilityResponse {
  const factory PokemonAbilityResponse({
    required Ability ability,
    required int slot,
  }) = _PokemonAbilityResponse;

  factory PokemonAbilityResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityResponseFromJson(json);
}

@freezed
abstract class Ability with _$Ability {
  const factory Ability({required String name, required String url}) = _Ability;

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
}
