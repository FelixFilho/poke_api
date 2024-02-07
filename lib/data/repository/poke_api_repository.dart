import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:poke_api/core/utils/constants/poke_constants.dart';
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
}
