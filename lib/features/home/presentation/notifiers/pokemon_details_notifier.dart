import 'dart:async';

import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';
import 'package:poke_app/features/home/domain/usecases/get_pokemon_detail_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_details_notifier.g.dart';

@riverpod
class PokemonDetailsNotifier extends _$PokemonDetailsNotifier {
  @override
  Future<PokemonDetailResponse> build(String url) async {
    final getPokemonDetail = ref.read(getPokemonDetailUsecaseProvider);
    return getPokemonDetail(url);
  }
}
