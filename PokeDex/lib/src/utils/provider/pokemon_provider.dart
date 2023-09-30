import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/model.dart';

class PokemonProvider with ChangeNotifier {
  final String _baseURL = 'https://pokeapi.co/api/v2/pokemon';

  PokemonsModel _pokemons = PokemonsModel();
  PokemonsModel get pokemons => _pokemons;

  final List<PokemonDetailModel> _pokemonsDetail = [];
  List<PokemonDetailModel> get pokemonsDetail => _pokemonsDetail;

  final List<FavoritePokemon> _favoritePokemons = [];
  List<FavoritePokemon> get favoritePokemons => _favoritePokemons;

  void toggleFavorite(PokemonDetailModel pokemon) {
    final index = _favoritePokemons.indexWhere(
      (p) => p.pokemon.name == pokemon.name,
    );

    if (index != -1) {
      _favoritePokemons.removeAt(index);
    } else {
      _favoritePokemons
          .add(FavoritePokemon(pokemon: pokemon, isFavorite: true));
    }

    notifyListeners();
  }

  Future<dynamic> getPokemons() async {
    try {
      Uri url = Uri.parse(_baseURL);
      final response = await http.get(url);
      final data = pokemonsModelFromJson(response.body);

      if (response.statusCode == 200) {
        _pokemons = data;
        notifyListeners();

        for (var result in _pokemons.results!) {
          await getPokemonsDetail(resultURL: result.url!);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> getMorePokemons() async {
    try {
      if (kDebugMode) {
        print('test');
      }
      Uri url = Uri.parse(_pokemons.next!);
      final response = await http.get(url);
      final data = pokemonsModelFromJson(response.body);

      if (response.statusCode == 200) {
        _pokemons = data;
        notifyListeners();

        for (var result in _pokemons.results!) {
          await getPokemonsDetail(resultURL: result.url!);
        }
        return _pokemons;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> getPokemonsDetail({required String resultURL}) async {
    try {
      Uri url = Uri.parse(resultURL);
      final response = await http.get(url);
      final data = pokemonDetailModelFromJson(response.body);

      if (response.statusCode == 200) {
        _pokemonsDetail.add(data);
        notifyListeners();

        return _pokemonsDetail;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
