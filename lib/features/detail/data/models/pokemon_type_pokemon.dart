import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_type_pokemon.freezed.dart';
part 'pokemon_type_pokemon.g.dart';

@freezed
abstract class PokemonTypePokemon with _$PokemonTypePokemon {
  const factory PokemonTypePokemon({
    required Map<String, dynamic> pokemon,
    required int slot,
  }) = _PokemonTypePokemon;

  factory PokemonTypePokemon.fromJson(Map<String, dynamic> json) => _$PokemonTypePokemonFromJson(json);
}

