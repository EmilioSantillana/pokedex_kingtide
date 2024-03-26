import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../views/home/model/pokemon_model.dart';
import 'gradient_text.dart';

class PokemonCard extends StatelessWidget {
  PokemonCard({
    super.key,
    required this.pokemon,
  });

  final PokemonModel pokemon;
  final List<Color> colors = [Colors.red, Colors.orange];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Card(
        elevation: 5,
        shadowColor: Colors.redAccent,
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
                      colors: colors,
                      style: const TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                  GradientText(
                    text: "${pokemon.id}",
                    colors: colors,
                    style: const TextStyle(
                      fontSize: 15
                    ),
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
                            colors: colors,
                            style: const TextStyle(
                              fontSize: 8
                            ),
                          ),
                          GradientText(
                            text: "Weight: ${pokemon.weight}hg",
                            colors: colors,
                            style: const TextStyle(
                              fontSize: 8
                            ),
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
