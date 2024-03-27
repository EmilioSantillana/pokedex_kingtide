import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/network/dio_manager.dart';
import '../../../core/services/pokemon_service.dart';
import '../../../core/widgets/gradient_text.dart';
import '../../../core/widgets/pokeball_progress_indicator.dart';
import '../viewModel/home_view_model.dart';
import 'pokemons_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _homeViewModel =
      HomeViewModel(PokemonService(DioManager.instance.dio));

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _homeViewModel.fetchAllPokemonService();

    //Paginacion
    _scrollController.addListener(paginate);

    //Buscador
    _searchController.addListener(filterPokemons);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pokemon',
      ),
      home: _buildHomeView(),
    );
  }

  Observer _buildHomeView() {
    return Observer(
      builder: (_) {
        switch (_homeViewModel.pokemonServiceState) {
          case PokemonServiceState.loading:
            if (_homeViewModel.pokemons.isEmpty) {
              return const Scaffold(
                body: Center(
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
                        text: "Loading Pokedex...",
                        colors: [Colors.red, Colors.orange],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return PokemonsView(
                searchController: _searchController,
                homeViewModel: _homeViewModel,
                isLoading: true,
              );
            }
          case PokemonServiceState.success:
            return PokemonsView(
              searchController: _searchController,
              homeViewModel: _homeViewModel,
              scrollController: _scrollController,
            );
          case PokemonServiceState.error:
            return const Center(
              child: GradientText(
                text: "Something went wrong!",
                colors: [Colors.red, Colors.orange],
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  void paginate() {
    if(_homeViewModel.isFiltered) return;
    
    if (_scrollController.position.maxScrollExtent == _scrollController.offset 
      && _homeViewModel.pokemonServiceState != PokemonServiceState.loading 
      && !_homeViewModel.allDataFetched.value) {
      _homeViewModel.offset == 0
          ? _homeViewModel.offset += _homeViewModel.initialLimit
          : _homeViewModel.offset += 50;
      _homeViewModel.fetchAllPokemonService();
    }
  }

  void filterPokemons() {
    if (_searchController.text.isNotEmpty) {
      _homeViewModel.filteredPokemons = _homeViewModel.pokemons
          .where((pokemon) => pokemon!.name!
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();

      _homeViewModel.isFiltered = true;
    } else {
      _homeViewModel.filteredPokemons = _homeViewModel.pokemons;
      _homeViewModel.isFiltered = false;
    }
  }
}
