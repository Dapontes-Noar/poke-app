import 'package:poke_app/features/home/data/models/all_pokemons_response.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';

abstract class HomeRepository {
  Future<AllPokemonsResponse> getAllPokemons();
  Future<PokemonDetailResponse> getPokemonDetail(String nameOrId);
}
