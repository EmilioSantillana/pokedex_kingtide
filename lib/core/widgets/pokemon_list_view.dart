import 'package:flutter/material.dart';
import '../../views/home/model/pokemon_model.dart';
import 'pokemon_card.dart';

class PokemonListView extends StatelessWidget {
  const PokemonListView({
    super.key,
    this.scrollController,
    required this.pokemonsList,
  });

  final ScrollController? scrollController;
  final List<PokemonModel?> pokemonsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: const PageStorageKey(0),
      controller: scrollController,
      itemCount: pokemonsList.length,
      itemBuilder: (context, index) {
        PokemonModel? pokemon = pokemonsList[index];
        if (pokemon != null) {
          return PokemonCard(pokemon: pokemon);
        } else {
          return Container();
        }
      }
    );
  }
}
