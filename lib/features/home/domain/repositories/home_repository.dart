import 'package:poke_app/features/home/data/models/all_pokemons_response.dart';
import 'package:poke_app/features/home/data/models/all_types_response.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/data/models/pokemons_by_type_response.dart';

/// Repository interface for fetching Pokémon data.
abstract class HomeRepository {
  Future<AllPokemonsResponse> getAllPokemons();
  Future<PokemonDetailResponse> getPokemonDetail(String nameOrId);
  Future<AllTypesResponse> getAllTypes();
  Future<PokemonsByTypeResponse> getPokemonsByType(String name);
}
