import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_api/core/utils/dependency_injection/dependency_injection.dart';
import 'package:poke_api/pages/pokemon_list_page/view/pokemon_list_page.dart';

void main() {
  setUpGetIt();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        home: PokemonListPage(),
      ),
    );
  }
}
