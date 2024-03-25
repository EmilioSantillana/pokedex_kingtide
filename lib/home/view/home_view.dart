import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/network/dio_manager.dart';
import '../../core/services/pokemon_service.dart';
import '../model/pokemon_model.dart';
import '../viewModel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _homeViewModel =
      HomeViewModel(PokemonService(DioManager.instance.dio));

  @override
  void initState() {
    super.initState();
    _homeViewModel.fetchAllPokemonService();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: _buildPokemonList()),
    );
  }

  Observer _buildPokemonList() {
    return Observer(
      builder: (_) {
        switch (_homeViewModel.pokemonServiceState) {
          case PokemonServiceState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case PokemonServiceState.success:
            List<PokemonModel?> pokemonsList = _homeViewModel.pokemons;
            return ListView.builder(
                itemCount: pokemonsList.length,
                itemBuilder: (context, index) {
                  PokemonModel? pokemon = pokemonsList[index];
                  if (pokemon != null) {
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
                              children: <Widget>[
                                // Add an image widget to display an image
                                SvgPicture.network(
                                  'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/${pokemon.id}.svg',
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                // Add some spacing between the image and the text
                                Container(width: 20),
                                // Add an expanded widget to take up the remaining horizontal space
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // Add some spacing between the top of the card and the title
                                      Container(height: 5),
                                      // Add a title widget
                                      const Text(
                                        "Cards Title 1",
                                      ),
                                      // Add some spacing between the title and the subtitle
                                      Container(height: 5),
                                      // Add a subtitle widget
                                      const Text(
                                        "Sub title",
                                      ),
                                      // Add some spacing between the subtitle and the text
                                      Container(height: 10),
                                      // Add a text widget to display some text
                                      Text(
                                        pokemon.name ?? "No name",
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
                  } else {
                    return Container();
                  }
                });
          case PokemonServiceState.error:
            return const Center(
              child: Text("Something went wrong!"),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
