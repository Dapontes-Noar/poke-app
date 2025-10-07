import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_form_description.freezed.dart';

part 'pokemon_form_description.g.dart';

@freezed
abstract class PokemonFormDescription with _$PokemonFormDescription {
  const factory PokemonFormDescription({
    required String description,
    required String language,
  }) = _PokemonFormDescription;

  factory PokemonFormDescription.fromJson(Map<String, dynamic> json) =>
      _$PokemonFormDescriptionFromJson(json);
}