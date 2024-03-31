import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../views/home/model/pokemon_model.dart';
import '../colors/pokemon_type_colors.dart';
import 'gradient_text.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  final PokemonModel pokemon;

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
                        : Center(
                            child: GradientText(
                              text: "NO IMAGE",
                              colors: currentColors,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
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
