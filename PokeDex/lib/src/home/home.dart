import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/src/home/screen/screen.dart';
import 'package:simple_icons/simple_icons.dart';

import '../utils/constant/constant.dart';
import '../utils/provider/provider.dart';
import '../widget/widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<PokemonProvider>().getMorePokemons();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: context.read<PokemonProvider>().getPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget(size: size);
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: const Color(0xFFfee53c),
              title: const Text(
                'Pokemon',
                style: TextStyle(color: Colors.black),
              ),
              leading: IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoritePokemonScreen(),
                  ),
                ),
                color: Colors.black,
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: IconButton(
                    icon: const Icon(
                      SimpleIcons.github,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      launchURL(url: 'https://github.com/tinguar/flutter/tree/main/PokeDex');
                    },
                  ),
                )
              ],
            ),
            body: Consumer<PokemonProvider>(
                builder: (context, pokemon, _) => GridView.count(
                      padding: const EdgeInsets.all(20),
                      controller: _scrollController,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      children: pokemon.pokemonsDetail
                          .map(
                            (pokemon) => Stack(
                              fit: StackFit.expand,
                              children: [
                                PokemonWidget(
                                  pokemon: pokemon,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PokemonScreen(pokemon: pokemon),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    )),
          );
        }
      },
    );
  }
}
