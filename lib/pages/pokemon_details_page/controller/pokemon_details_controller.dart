import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api/core/utils/dependency_injection/dependency_injection.dart';
import 'package:poke_api/data/models/pokemon.dart';
import 'package:poke_api/data/repository/poke_api_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_details_controller.freezed.dart';
part 'pokemon_details_controller.g.dart';

@freezed
class PokemonDetailsState with _$PokemonDetailsState {
  const factory PokemonDetailsState({
    String? errorMessage,
    required bool isLoading,
    required Pokemon pokemon,
  }) = _PokemonDetailsState;
}

@riverpod
class PokemonDetailsController extends _$PokemonDetailsController {
  PokeApiRepository get _pokeApiRepository => getIt<PokeApiRepository>();

  @override
  PokemonDetailsState build(String pokemonName) {
    Future(getPokemonDetails);

    return PokemonDetailsState(isLoading: true, pokemon: Pokemon.empty());
  }

  Future<void> getPokemonDetails() async {
    state = state.copyWith(isLoading: true);
    final pokemonDetails =
        await _pokeApiRepository.getPokemonDetails(pokemonName);

    pokemonDetails.when(
      (pokemon) => state = state.copyWith(
        pokemon: pokemon,
        isLoading: false,
      ),
      (error) => state.copyWith(isLoading: false, errorMessage: error),
    );
  }
}
