// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_app/features/home/data/models/pokemon_type_response.dart';

part 'pokemon_type_damage_relations.freezed.dart';

part 'pokemon_type_damage_relations.g.dart';

@freezed
abstract class PokemonTypeDamageRelations with _$PokemonTypeDamageRelations {
  const factory PokemonTypeDamageRelations({
    @JsonKey(name: 'double_damage_from')
    required List<TypeInfoResponse>? doubleDamageFrom,
    @JsonKey(name: 'double_damage_to')
    required List<TypeInfoResponse>? doubleDamageTo,
    @JsonKey(name: 'half_damage_from')
    required List<TypeInfoResponse>? halfDamageFrom,
    @JsonKey(name: 'half_damage_to')
    required List<TypeInfoResponse>? halfDamageTo,
    @JsonKey(name: 'no_damage_from')
    required List<TypeInfoResponse>? noDamageFrom,
    @JsonKey(name: 'no_damage_to') required List<TypeInfoResponse> noDamageTo,
  }) = _PokemonTypeDamageRelations;

  factory PokemonTypeDamageRelations.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeDamageRelationsFromJson(json);
}
