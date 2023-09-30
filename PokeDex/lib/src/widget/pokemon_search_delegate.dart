import 'package:flutter/material.dart';
import 'package:pokedex/src/utils/constant/constant.dart';

import '../home/screen/pokemon_screen.dart';
import '../utils/model/pokemon_details_model.dart';

class PokemonSearchDelegate extends SearchDelegate<String> {
  final List<FavoritePokemon> savedPokemons;

  PokemonSearchDelegate(this.savedPokemons);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = savedPokemons
        .where((pokemon) => pokemon.pokemon.name!.toLowerCase().contains(query.toLowerCase()) && pokemon.isFavorite);

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final pokemon = results.elementAt(index).pokemon;

        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PokemonScreen(pokemon: pokemon),
              ),
            );
          },
          title: Text(pokemon.name!),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = savedPokemons
        .where((pokemon) => pokemon.pokemon.name!.toLowerCase().contains(query.toLowerCase()) && pokemon.isFavorite);

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final pokemon = results.elementAt(index).pokemon;

        return ListTile(
          textColor: getBackGroundColor(pokemon.types![0].type!.name!),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PokemonScreen(pokemon: pokemon),
              ),
            );
          },
          title: Text(
            pokemon.name!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
