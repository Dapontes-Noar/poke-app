import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_app/features/home/data/models/pokemon_response.dart';

part 'all_pokemons_response.freezed.dart';

part 'all_pokemons_response.g.dart';

@freezed
abstract class AllPokemonsResponse with _$AllPokemonsResponse {
  const factory AllPokemonsResponse({
    required int count,
    required String? next,
    required String? previous,
    required List<PokemonResponse> results,
  }) = _AllPokemonsResponse;

  factory AllPokemonsResponse.fromJson(Map<String, dynamic> json) =>
      _$AllPokemonsResponseFromJson(json);
}
