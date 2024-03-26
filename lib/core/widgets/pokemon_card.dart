import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../views/home/model/pokemon_model.dart';
import 'gradient_text.dart';

class PokemonCard extends StatelessWidget {
  PokemonCard({
    super.key,
    required this.pokemon,
  });

  final PokemonModel pokemon;
  final Map<PokemonTypes, List<Color>> pokemonTypeColors = {
    PokemonTypes.normal: [Colors.brown, Colors.grey],
    PokemonTypes.fire: [Colors.red, Colors.orange],
    PokemonTypes.water: [Colors.blue, Colors.lightBlue],
    PokemonTypes.grass: [Colors.green, Colors.lightGreen],
    PokemonTypes.electric: [Colors.orange, Colors.orange[300]!],
    PokemonTypes.ice: [Colors.blueGrey, Colors.lightBlue],
    PokemonTypes.fighting: [Colors.red, Colors.redAccent],
    PokemonTypes.poison: [Colors.purple, Colors.purpleAccent],
    PokemonTypes.ground: [Colors.brown, Colors.orange[800]!],
    PokemonTypes.flying: [Colors.purple[300]!, Colors.purple[100]!],
    PokemonTypes.psychic: [Colors.pink, Colors.pinkAccent],
    PokemonTypes.bug: [Colors.lime, Colors.lightGreen[300]!],
    PokemonTypes.rock: [Colors.brown, Colors.brown[300]!],
    PokemonTypes.ghost: [Colors.deepPurple, Colors.purple],
    PokemonTypes.dragon: [Colors.indigo, Colors.indigoAccent],
    PokemonTypes.steel: [Colors.blueGrey, Colors.blueGrey[300]!],
    PokemonTypes.dark: [Colors.brown[800]!, Colors.black],
    PokemonTypes.fairy: [Colors.pink[300]!, Colors.pink[100]!],
    PokemonTypes.stellar: [Colors.indigo[300]!, Colors.indigo[100]!],
  };

  @override
  Widget build(BuildContext context) {
    final List<Color> currentColors = pokemon.types != null
        ? pokemonTypeColors[pokemon.types!.first]!
        : pokemonTypeColors[PokemonTypes.normal]!;

    return SizedBox(
      height: 300,
      child: Card(
        surfaceTintColor: currentColors[0],
        elevation: 5,
        shadowColor: currentColors[1],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset(
                      'assets/images/pokeball.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(width: 5),
                  Flexible(
                    fit: FlexFit.tight,
                    child: GradientText(
                      text: pokemon.name != null
                          ? pokemon.name!.toUpperCase()
                          : "No name",
                      colors: currentColors,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  Column(
                    children: [
                      GradientText(
                        text: "${pokemon.id}",
                        colors: currentColors,
                        style: const TextStyle(fontSize: 15),
                      ),
                      for (var type in pokemon.types!)
                        Container(
                          width: 80,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: pokemonTypeColors[type]!,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Text(
                            type.name.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 8,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      width: 150,
                      child: pokemon.svgUrl != null
                          ? SvgPicture.network(
                              pokemon.svgUrl!,
                              fit: BoxFit.contain,
                            )
                          : Container(),
                    ),
                    Positioned(
                      top: 170,
                      left: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GradientText(
                            text: "Height: ${pokemon.height}dm",
                            colors: currentColors,
                            style: const TextStyle(fontSize: 10),
                          ),
                          GradientText(
                            text: "Weight: ${pokemon.weight}hg",
                            colors: currentColors,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
