// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api/data/models/simple_pokemon.dart';
part 'pokemon_list_with_pagination.freezed.dart';
part 'pokemon_list_with_pagination.g.dart';

@freezed
class PokemonListWithPagination with _$PokemonListWithPagination {
  const factory PokemonListWithPagination({
    required int count,
    required String next,
    String? previous,
    @JsonKey(name: 'results')
    required List<SimplePokemon> simplePokemonList,
  }) = _PokemonListWithPagination;

  factory PokemonListWithPagination.fromJson(Map<String, dynamic> json) =>
      _$PokemonListWithPaginationFromJson(json);
}
