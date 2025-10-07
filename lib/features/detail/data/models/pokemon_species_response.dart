// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_app/features/detail/data/models/pokemon_form_description.dart';
import 'package:poke_app/features/detail/data/models/pokemon_named_api_resource.dart';
import 'package:poke_app/features/detail/data/models/pokemon_flavor_text_entry.dart';
import 'package:poke_app/features/detail/data/models/pokemon_genus.dart';

part 'pokemon_species_response.freezed.dart';

part 'pokemon_species_response.g.dart';

@freezed
abstract class PokemonSpeciesResponse with _$PokemonSpeciesResponse {
  const factory PokemonSpeciesResponse({
    required int id,
    required String name,
    required PokemonNamedApiResource color,
    @JsonKey(name: 'egg_groups')
    required List<PokemonNamedApiResource> eggGroups,
    @JsonKey(name: 'flavor_text_entries')
    required List<PokemonFlavorTextEntry> flavorTextEntries,
    required List<PokemonGenus> genera,
    @JsonKey(name: 'gender_rate') required int genderRate,
    @JsonKey(name: 'form_descriptions')
    required List<PokemonFormDescription> formDescriptions,
  }) = _PokemonSpeciesResponse;

  factory PokemonSpeciesResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesResponseFromJson(json);
}
