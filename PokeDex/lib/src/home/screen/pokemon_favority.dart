import 'package:flutter/material.dart';
import 'package:pokedex/src/home/screen/screen.dart';
// import 'package:pokedex/src/widget/pokemon_search_delegate.dart';
import 'package:provider/provider.dart';
import 'package:simple_icons/simple_icons.dart';
import '../../utils/constant/constant.dart';
import '../../utils/provider/provider.dart';
import '../../widget/pokemon_animated_widget.dart';

class FavoritePokemonScreen extends StatefulWidget {
  const FavoritePokemonScreen({super.key});

  @override
  State<FavoritePokemonScreen> createState() => _FavoritePokemonScreenState();
}

class _FavoritePokemonScreenState extends State<FavoritePokemonScreen> {
  TextEditingController searchController = TextEditingController();
  // ...
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    final favoritePokemons =
        Provider.of<PokemonProvider>(context).favoritePokemons;

    final totalSavedPokemons = favoritePokemons.length;

    // final size = MediaQuery.of(context).size;

    // ignore: no_leading_underscores_for_local_identifiers
    void _onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    // ignore: no_leading_underscores_for_local_identifiers
    void _deleteItem() {
      setState(() {
        favoritePokemons.isEmpty ? null : favoritePokemons.clear();
      });
    }

    Future<void> gitUrl() {
      return launchURL(url: 'https://github.com/GbrielGarcia/PokeDex');
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFfee53c),
        centerTitle: true,
        title: const Text(
          'Favorite Pokemon',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Center(
              child: Text(
                '$totalSavedPokemons#',
                style: const TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
      body: favoritePokemons.isEmpty
          ? Center(
              child: Text(
                textAlign: TextAlign.center,
                'No favorite pokemons yet.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          : ListView.builder(
              itemCount: favoritePokemons.length,
              itemBuilder: (context, index) {
                final pokemon = favoritePokemons[index].pokemon;

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonScreen(pokemon: pokemon),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                          height: 100,
                          padding: const EdgeInsets.all(8.0),
                          color:
                              getBackGroundColor(pokemon.types![0].type!.name!),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: AnimatedExample(
                                  image: Image.network(
                                    pokemon.sprites!.other!.officialArtwork!
                                        .frontDefault!,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                children: [
                                  Text(
                                    pokemon.name!,
                                    style: const TextStyle(fontSize: 30.0),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: pokemon.types!
                                        .map(
                                          (e) => Container(
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 5, 10, 5),
                                            decoration: BoxDecoration(
                                              color: getBackGroundColor2(
                                                pokemon.types![0].type!.name!,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(e.type!.name!),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              SimpleIcons.github,
              color: Colors.black,
            ),
            label: 'code',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            label: 'Delete',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) async {
          if (index == 0) {
            gitUrl();
          } else if (index == 1) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: AlertDialog(
                    title: const Text('Eliminating'),
                    content: Text('You are eliminating: $totalSavedPokemons'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Close'),
                      ),
                      TextButton(
                        onPressed: () {
                          _deleteItem();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            _onItemTapped(index);
          }
        },
      ),
    );
  }
}
