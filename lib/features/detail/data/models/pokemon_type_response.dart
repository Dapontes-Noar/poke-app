// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_app/features/detail/data/models/pokemon_type_damage_relations.dart';

part 'pokemon_type_response.freezed.dart';
part 'pokemon_type_response.g.dart';

@freezed
abstract class PokemonTypeResponse with _$PokemonTypeResponse {
  const factory PokemonTypeResponse({
    required int id,
    required String name,
    @JsonKey(name: 'damage_relations')
    required PokemonTypeDamageRelations damageRelations,
  }) = _PokemonTypeResponse;

  factory PokemonTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeResponseFromJson(json);
}
