import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poke_api/core/utils/constants/poke_constants.dart';
part 'simple_pokemon.freezed.dart';

@freezed
class SimplePokemon with _$SimplePokemon {
  const SimplePokemon._();

  const factory SimplePokemon({
    required int number,
    required String name,
    required String spriteUrl,
  }) = _SimplePokemon;

  factory SimplePokemon.fromJson(Map<String, dynamic> json) {
    final urlStrings = (json['url'] as String).split('/');
    final pokemonNumber = urlStrings.elementAt(urlStrings.length - 2);
    final number = int.parse(pokemonNumber);

    final name = json['name'];

    final spriteUrl = '${PokeConstants.spriteBaseUrl}$pokemonNumber.png';

    return SimplePokemon(
      number: number,
      name: name,
      spriteUrl: spriteUrl,
    );
  }

  Map<String, dynamic> toJson() => {
        'number': number,
        'name': name,
        'spriteUrl': spriteUrl,
      };
}
