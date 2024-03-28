import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/widgets/pokeball_progress_indicator.dart';
import '../../../core/widgets/pokemon_list_view.dart';
import '../viewModel/home_view_model.dart';

class PokemonsView extends StatelessWidget {
  const PokemonsView({
    super.key,
    this.scrollController,
    required this.searchController,
    required this.homeViewModel,
    this.isLoading = false,
  });

  final ScrollController? scrollController;
  final TextEditingController searchController;
  final HomeViewModel homeViewModel;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return _buildMainHomeView();
  }

  Observer _buildMainHomeView() {
    return Observer(
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            title: TextField(
              controller: searchController,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none,
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: PokemonListView(
                      pokemonsList: homeViewModel.filteredPokemons.toList(),
                      scrollController: scrollController,
                    ),
                  ),
                ),
              ),
              if (isLoading)
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Center(
                    child: PokeballProgressIndicator(
                      pokeballSize: 50,
                      barRadius: 55,
                      strokeWidth: 10,
                    ),
                  ),
                )
              else
                Container(),
            ],
          ),
        );
      }
    );
  }
}