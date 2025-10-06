import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_app/features/home/data/models/pokemon_response.dart';

part 'type_response.freezed.dart';

part 'type_response.g.dart';

@freezed
abstract class TypeResponse with _$TypeResponse {
  const factory TypeResponse({required PokemonResponse pokemon}) =
      _TypeResponse;

  factory TypeResponse.fromJson(Map<String, dynamic> json) =>
      _$TypeResponseFromJson(json);
}
