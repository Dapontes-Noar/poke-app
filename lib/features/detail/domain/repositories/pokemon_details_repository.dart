import 'package:poke_app/features/detail/data/models/pokemon_species_response.dart';
import 'package:poke_app/features/detail/data/models/pokemon_type_response.dart';

/// Repository interface for fetching Pokémon species data.
abstract class PokemonDetailsRepository {
  Future<PokemonSpeciesResponse> getPokemonSpecies(String idOrName);
  Future<PokemonTypeResponse> getPokemonType(String idOrName);
}
