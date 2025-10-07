import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_app/features/detail/data/models/pokemon_named_api_resource.dart';

part 'pokemon_genus.freezed.dart';
part 'pokemon_genus.g.dart';

@freezed
abstract class PokemonGenus with _$PokemonGenus {
  const factory PokemonGenus({
    required String genus,
    required PokemonNamedApiResource language,
  }) = _PokemonGenus;

  factory PokemonGenus.fromJson(Map<String, dynamic> json) =>
      _$PokemonGenusFromJson(json);
}
