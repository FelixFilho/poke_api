import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_api/core/utils/extensions/string_extensions.dart';
import 'package:poke_api/pages/pokemon_details_page/controller/pokemon_details_controller.dart';

class PokemonDetailsPage extends ConsumerWidget {
  final String pokemonName;
  const PokemonDetailsPage({super.key, required this.pokemonName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pokemonDetailsControllerProvider(pokemonName));

    if (state.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon details'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final pokemon = state.pokemon;

    return Scaffold(
        appBar: AppBar(
          title: Text('Pokemon: ${pokemon.name.toCapitalized()}'),
        ),
        body: Container());
  }
}
