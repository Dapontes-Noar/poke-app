import 'dart:async';

import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'poke_details_notifier.g.dart';

@riverpod
class PokeDetailsNotifier extends _$PokeDetailsNotifier {
  @override
  Future<PokemonDetailResponse> build(String name) async {
    final getPokemonDetail = ref.read(getPokemonDetailUsecaseProvider);
    return getPokemonDetail(name);
  }
}
