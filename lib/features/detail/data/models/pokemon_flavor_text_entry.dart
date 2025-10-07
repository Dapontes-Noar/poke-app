// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_app/features/detail/data/models/pokemon_named_api_resource.dart';

part 'pokemon_flavor_text_entry.freezed.dart';
part 'pokemon_flavor_text_entry.g.dart';

@freezed
abstract class PokemonFlavorTextEntry with _$PokemonFlavorTextEntry {
  const factory PokemonFlavorTextEntry({
    @JsonKey(name: 'flavor_text') required String flavorText,
    required PokemonNamedApiResource language,
    required PokemonNamedApiResource version,
  }) = _PokemonFlavorTextEntry;

  factory PokemonFlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      _$PokemonFlavorTextEntryFromJson(json);
}
