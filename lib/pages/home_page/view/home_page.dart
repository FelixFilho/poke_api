import 'package:flutter/material.dart';
import 'package:poke_api/pages/pokemon_list_page/view/pokemon_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onPokemonListPressed(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => const PokemonListPage()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poke API'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => _onPokemonListPressed(context),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(48),
                  child: Center(child: Text('Pokemon list')),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(48),
                child: Center(
                    child: Text(
                  'Coming soon',
                  style: TextStyle(color: Colors.grey),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
