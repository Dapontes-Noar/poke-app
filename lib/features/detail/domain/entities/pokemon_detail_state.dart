import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_app/features/detail/data/models/pokemon_species_response.dart';
import 'package:poke_app/features/detail/data/models/pokemon_type_response.dart';

part 'pokemon_detail_state.freezed.dart';

@freezed
abstract class PokemonDetailState with _$PokemonDetailState {
  const factory PokemonDetailState({
    @Default(false) bool isLoading,
    String? errorMessage,
    PokemonSpeciesResponse? species,
    PokemonTypeResponse? type,
  }) = _PokemonDetailState;

  factory PokemonDetailState.initial() =>
      PokemonDetailState(isLoading: false, errorMessage: null, species: null);
}
