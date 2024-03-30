import 'package:flutter/material.dart';
import '../../views/home/model/pokemon_model.dart';
import '../../views/home/viewModel/home_view_model.dart';
import '../../views/show/view/show_view.dart';
import 'pokemon_card.dart';

class PokemonListView extends StatelessWidget {
  const PokemonListView({
    super.key,
    this.scrollController,
    required this.pokemonsList, 
    required this.homeViewModel,
  });

  final HomeViewModel homeViewModel;
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
        return pokemon != null 
        ? GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowView(pokemon: pokemon, homeViewModel: homeViewModel),
                ),
              );
            },
            child: PokemonCard(pokemon: pokemon)
          ) 
        : Container();
      }
    );
  }
}
