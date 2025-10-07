import 'package:poke_app/features/detail/data/models/pokemon_species_response.dart';
import 'package:poke_app/features/detail/data/models/pokemon_type_response.dart';
import 'package:poke_app/features/detail/domain/entities/pokemon_detail_state.dart';
import 'package:poke_app/features/detail/domain/usecases/get_pokemon_species_usecase.dart';
import 'package:poke_app/features/detail/domain/usecases/get_pokemon_type_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_details_notifier.g.dart';

@riverpod
class PokemonDetailsNotifier extends _$PokemonDetailsNotifier {
  @override
  Future<PokemonDetailState> build(String idOrName, String typeIdOrName) async {
    final getPokemonSpecies = ref.read(getPokemonSpeciesUseCaseProvider);
    final getPokemonType = ref.read(getPokemonTypeUseCaseProvider);
    try {
      final results = await Future.wait([
        getPokemonSpecies(idOrName),
        getPokemonType(typeIdOrName),
      ]);
      final species = results[0] as PokemonSpeciesResponse;
      final type = results[1] as PokemonTypeResponse;

      return PokemonDetailState(species: species, type: type);
    } catch (e, st) {
      return Future.error(e, st);
    }
  }
}
