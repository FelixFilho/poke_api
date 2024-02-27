import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_api/core/utils/extensions/string_extensions.dart';
import 'package:poke_api/pages/pokemon_details_page/view/pokemon_details_page.dart';
import 'package:poke_api/pages/pokemon_list_page/controller/pokemon_list_controller.dart';

class PokemonListPage extends ConsumerWidget {
  const PokemonListPage({super.key});

  void _onPokemonPressed(BuildContext context, String pokemonName) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => PokemonDetailsPage(
                pokemonName: pokemonName,
              )));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pokemonListControllerProvider);

    if (state.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon list'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon list'),
      ),
      body: ListView.builder(
        itemCount: state.pokemonList.length,
        itemBuilder: (context, index) {
          final pokemon = state.pokemonList.elementAt(index);
          return ListTile(
            leading: Image.network(pokemon.spriteUrl),
            title: Text(pokemon.name.toCapitalized()),
            subtitle: Text(pokemon.number.toString().padLeft(4, '0')),
            onTap: () => _onPokemonPressed(context, pokemon.name),
          );
        },
      ),
    );
  }
}
