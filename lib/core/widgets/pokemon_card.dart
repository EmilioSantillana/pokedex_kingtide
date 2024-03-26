import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../views/home/model/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      // Define the shape of the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      // Define how the card's content should be clipped
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // Define the child widget of the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Add padding around the row widget
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Add an image widget to display an image
                SizedBox(
                  height: 100,
                  width: 100,
                  child: pokemon.svgUrl != null
                      ? SvgPicture.network(
                          pokemon.svgUrl!,
                          fit: BoxFit.contain,
                        )
                      : Container(),
                ),
                // Add some spacing between the image and the text
                Container(width: 20),
                // Add an expanded widget to take up the remaining horizontal space
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Add some spacing between the top of the card and the title
                      Container(height: 5),
                      // Add a title widget
                      Text(
                        pokemon.name != null ? pokemon.name!.toUpperCase() : "Sin nombre",
                      ),
                      // Add some spacing between the title and the subtitle
                      Container(height: 5),
                      // Add a subtitle widget
                      Text(
                        "ID: ${pokemon.id}",
                      ),
                      // Add some spacing between the subtitle and the text
                      Container(height: 10),
                      // Add a text widget to display some text
                      Text(
                        "Height: ${pokemon.height}dm",
                        maxLines: 2,
                      ),
                      Text(
                        "Weight: ${pokemon.weight}hg",
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
