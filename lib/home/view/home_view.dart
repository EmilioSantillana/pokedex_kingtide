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
  final HomeViewModel _homeViewModel = HomeViewModel(PokemonService(DioManager.instance.dio));

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _homeViewModel.fetchAllPokemonService(limit: 10);

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        _homeViewModel.incrementOffset(10);
        _homeViewModel.fetchAllPokemonService(limit: 10);
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
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
            if(_homeViewModel.pokemons.isEmpty){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
              List<PokemonModel?> pokemonsList = _homeViewModel.pokemons;
              return PokemonListView(pokemonsList: pokemonsList);
            }
          case PokemonServiceState.success:
            List<PokemonModel?> pokemonsList = _homeViewModel.pokemons;
            return PokemonListView(scrollController: scrollController, pokemonsList: pokemonsList);
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
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              // Add some spacing between the top of the card and the title
                              Container(height: 5),
                              // Add a title widget
                              Text(
                                pokemon.name ?? "No name",
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
                              const Text(
                                "asd",
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
      }
    );
  }
}
