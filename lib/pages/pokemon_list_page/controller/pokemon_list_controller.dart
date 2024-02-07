import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api/core/utils/dependency_injection/dependency_injection.dart';
import 'package:poke_api/data/models/simple_pokemon.dart';
import 'package:poke_api/data/repository/poke_api_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_list_controller.freezed.dart';
part 'pokemon_list_controller.g.dart';

@freezed
class PokemonListState with _$PokemonListState {
  const factory PokemonListState({
    required bool isLoading,
    required bool isLoadingMore,
    required List<SimplePokemon> pokemonList,
    String? errorMessage,
  }) = _PokemonListState;
}

@riverpod
class PokemonListController extends _$PokemonListController {
  PokeApiRepository get _pokeApiRepository => getIt<PokeApiRepository>();

  @override
  PokemonListState build() {
    Future(getPokemonList);

    return const PokemonListState(
      isLoading: true,
      isLoadingMore: false,
      pokemonList: [],
    );
  }

  Future<void> getPokemonList() async {
    state = state.copyWith(isLoading: true);
    final pokemonListWithPagination =
        await _pokeApiRepository.getPokemonListWithPagination();

    pokemonListWithPagination.when(
      (success) => state = state.copyWith(
        isLoading: false,
        pokemonList: success.simplePokemonList,
      ),
      (error) => state.copyWith(isLoading: false, errorMessage: error),
    );
  }
}
