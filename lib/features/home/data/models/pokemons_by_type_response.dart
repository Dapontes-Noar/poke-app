import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_app/features/home/data/models/type_response.dart';

part 'pokemons_by_type_response.freezed.dart';

part 'pokemons_by_type_response.g.dart';

@freezed
abstract class PokemonsByTypeResponse with _$PokemonsByTypeResponse {
  const factory PokemonsByTypeResponse({required List<TypeResponse> pokemon}) =
      _PokemonsByTypeResponse;

  factory PokemonsByTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonsByTypeResponseFromJson(json);
}
