import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/constant/constant.dart';
import '../../utils/model/model.dart';
import '../../utils/provider/provider.dart';
import '../../widget/pokemon_animated_widget.dart';
import '../../widget/widget.dart';

class PokemonScreen extends StatefulWidget {
  final PokemonDetailModel pokemon;
  const PokemonScreen({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  AnimationController? _controllerAnimated;

  void init(TickerProvider tickerProvider) {
    _tabController = TabController(
      length: 2,
      vsync: tickerProvider,
    );
  }

  void animatedController(TickerProvider tickerProvider) {
    _controllerAnimated = AnimationController(
        vsync: tickerProvider, duration: const Duration(seconds: 20));
  }

  @override
  void initState() {
    super.initState();
    init(this);
    animatedController(this);
    _controllerAnimated?.repeat();
  }

  @override
  void dispose() {
    _controllerAnimated?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final isFavorite = Provider.of<PokemonProvider>(context)
        .favoritePokemons
        .any((p) => p.pokemon.name == widget.pokemon.name);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            getBackGroundColor(widget.pokemon.types![0].type!.name!),
        title: const Text(
          'Pokemon',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<PokemonProvider>(context, listen: false)
                  .toggleFavorite(widget.pokemon);
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 250,
                width: double.infinity,
                color: getBackGroundColor(widget.pokemon.types![0].type!.name!),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.pokemon.name!,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '# ${widget.pokemon.id.toString()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: widget.pokemon.types!
                          .map(
                            (e) => Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                color: getBackGroundColor2(
                                  widget.pokemon.types![0].type!.name!,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(e.type!.name!),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color:
                      getBackGroundColor(widget.pokemon.types![0].type!.name!),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          child: TabBar(
                            labelPadding: const EdgeInsets.all(10),
                            indicatorColor: getBackGroundColor(
                                widget.pokemon.types![0].type!.name!),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            controller: _tabController,
                            tabs: const [
                              Text('Information'),
                              Text('Statistics'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                PokemonAboutPokemonWidget(
                                    pokemon: widget.pokemon,
                                    isFavorite: isFavorite),
                                PokemonBaseStatsWidget(pokemon: widget.pokemon),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 60.0,
            right: 40.0,
            child: IgnorePointer(
              ignoring: true,
              child: AnimatedBuilder(
                animation: _controllerAnimated!,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controllerAnimated!.value * 2 * pi,
                    child: child,
                  );
                },
                child: Image.asset(
                  'assets/image/pokeball.png',
                  width: size.width / 1.5,
                  color: Colors.white30,
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.25,
            top: MediaQuery.of(context).size.width * 0.25,
            child: SizedBox(
              height: 200,
              width: 200,
              child: AnimatedExample(
                image: Image.network(
                  widget.pokemon.sprites!.other!.officialArtwork!.frontDefault!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
