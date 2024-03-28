import 'dart:async';

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
  final HomeViewModel _homeViewModel = HomeViewModel(PokemonService(DioManager.instance.dio));

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _homeViewModel.fetchAllPokemonService();

    //Paginacion
    _scrollController.addListener(getPaginatedPokemons);

    //Buscador
    _searchController.addListener(() {
      // Cancelar el temporizador anterior si existe
      if (_debounceTimer != null && _debounceTimer!.isActive) {
        _debounceTimer!.cancel();
      }

      // Configurar un nuevo temporizador de debouncing
      _debounceTimer = Timer(const Duration(milliseconds: 500), () {
        filterPokemons();
      });
    });
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
            return const Scaffold(
              body: Center(
                child: GradientText(
                  text: "Something went wrong!",
                  colors: [Colors.red, Colors.orange],
                ),
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  void getPaginatedPokemons() {
    if(_homeViewModel.isFiltered 
    || _homeViewModel.pokemonServiceState == PokemonServiceState.loading 
    || _homeViewModel.allDataFetched) return;
    
    if (_scrollController.position.maxScrollExtent == _scrollController.offset) {
      _homeViewModel.currentLimit = 50;
      _homeViewModel.fetchAllPokemonService();
    }
  }

  Future<void> filterPokemons() async{
    if(_homeViewModel.pokemonServiceState == PokemonServiceState.loading) return;

    if (_searchController.text.isNotEmpty) {
      _homeViewModel.filteredPokemons = _homeViewModel.pokemons
          .where((pokemon) => pokemon!.name!
            .toLowerCase()
            .contains(_searchController.text.toLowerCase())
          ).toSet();

      final filteredPokemonsName = _homeViewModel.allPokemonsName
        .where(
          (name) => name.toLowerCase().contains(_searchController.text.toLowerCase())
        )
        .where(
          (name) => !_homeViewModel.pokemons.any(
            (pokemon) => pokemon!.name!.toLowerCase() == name.toLowerCase()
          )
        ).toList();

      if (filteredPokemonsName.isNotEmpty){
        _homeViewModel.fetchPokemonsByNamesService(pokemonsNames: filteredPokemonsName);
      }

      _homeViewModel.isFiltered = true;
    } else {
      _homeViewModel.filteredPokemons = _homeViewModel.pokemons;
      _homeViewModel.isFiltered = false;
    }
  }
}
