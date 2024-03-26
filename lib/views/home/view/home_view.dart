import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/network/dio_manager.dart';
import '../../../core/services/pokemon_service.dart';
import '../../../core/widgets/gradient_text.dart';
import '../../../core/widgets/pokeball_progress_indicator.dart';
import '../model/pokemon_model.dart';
import '../viewModel/home_view_model.dart';
import '../../../core/widgets/pokemon_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _homeViewModel =
      HomeViewModel(PokemonService(DioManager.instance.dio));

  final scrollController = ScrollController();
  final int initialLimit = 100;

  @override
  void initState() {
    super.initState();
    _homeViewModel.fetchAllPokemonService(limit: initialLimit);

    //Paginacion (queda descartado por el momento)
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.offset &&
          !_homeViewModel.allDataFetched.value) {
        _homeViewModel.offset == 0
            ? _homeViewModel.offset += initialLimit
            : _homeViewModel.offset += 50;
        _homeViewModel.fetchAllPokemonService(limit: 50);
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
      theme: ThemeData(
        fontFamily: 'Pokemon',
      ),
      home: Scaffold(body: _buildPokemonList()),
    );
  }

  Observer _buildPokemonList() {
    return Observer(
      builder: (_) {
        switch (_homeViewModel.pokemonServiceState) {
          case PokemonServiceState.loading:
            if (_homeViewModel.pokemons.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PokeballProgressIndicator(
                      pokeballSize: 200,
                      barRadius: 250,
                      strokeWidth: 25,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GradientText(
                      text: "Loading Pokedex",
                      colors: [Colors.red, Colors.orange],
                    )
                  ],
                ),
              );
            } else {
              List<PokemonModel?> pokemonsList = _homeViewModel.pokemons;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: SizedBox(
                          width: 400,
                          child: PokemonListView(pokemonsList: pokemonsList)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                      child: PokeballProgressIndicator(
                        pokeballSize: 50,
                        barRadius: 55,
                        strokeWidth: 10,
                      ),
                    ),
                  ),
                ],
              );
            }
          case PokemonServiceState.success:
            List<PokemonModel?> pokemonsList = _homeViewModel.pokemons;
            return Center(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                  child: PokemonListView(
                      scrollController: scrollController,
                      pokemonsList: pokemonsList)),
            );
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