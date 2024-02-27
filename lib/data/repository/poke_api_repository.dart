import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:poke_api/core/utils/constants/poke_constants.dart';
import 'package:poke_api/data/models/pokemon.dart';
import 'package:poke_api/data/models/pokemon_list_with_pagination.dart';

class PokeApiRepository {
  final Dio _dio;

  PokeApiRepository({required Dio dio}) : _dio = dio;

  Future<Result<PokemonListWithPagination, String>>
      getPokemonListWithPagination() async {
    try {
      final result = await _dio.get(PokeConstants.methodGetPokemons);

      if (result.statusCode == 200) {
        final pokemonListWithPagination =
            PokemonListWithPagination.fromJson(result.data);

        return Success(pokemonListWithPagination);
      } else {
        return const Error('We had a problem retrieving your Pokemons');
      }
    } catch (e) {
      return const Error('We had a problem retrieving your Pokemons');
    }
  }

  Future<Result<Pokemon, String>> getPokemonDetails(String pokemonName) async {
    try {
      final result =
          await _dio.get(PokeConstants.methodGetPokemonDetails + pokemonName);

      if (result.statusCode == 200) {
        // TODO make the pokemon details object
        final pokemonDetails = Pokemon.fromJson(result.data);

        return Success(pokemonDetails);
      } else {
        return const Error('We had a problem retrieving your Pokemon');
      }
    } catch (e) {
      return const Error('We had a problem retrieving your Pokemon');
    }
  }
}
