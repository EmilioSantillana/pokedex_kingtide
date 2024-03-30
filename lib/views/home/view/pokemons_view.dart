import 'dart:async';

import 'package:flutter/material.dart';
import '../../../core/widgets/pokeball_progress_indicator.dart';
import '../../../core/widgets/pokemon_list_view.dart';
import '../../../core/widgets/pokemon_type_filter_dialog.dart';
import '../viewModel/home_view_model.dart';

class PokemonsView extends StatefulWidget {
  const PokemonsView({
    super.key,
    this.scrollController,
    required this.homeViewModel,
    this.isLoading = false,
  });

  final ScrollController? scrollController;
  final HomeViewModel homeViewModel;
  final bool isLoading;

  @override
  State<PokemonsView> createState() => _PokemonsViewState();
}

class _PokemonsViewState extends State<PokemonsView> {
  Timer? _debounce;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
          children: [
            widget.isLoading 
            ? Container(
              padding: const EdgeInsets.only(right: 5),
              child: const PokeballProgressIndicator(
                  pokeballSize: 25,
                  barRadius: 30,
                  strokeWidth: 5,
                ),
              )
            : Container(),
            Expanded(
              child: TextField(
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  if (_debounce?.isActive ?? false) _debounce?.cancel();

                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    widget.homeViewModel.searchText = value;
                    widget.homeViewModel.filterPokemonsService();
                  });
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.filter_list, color: Colors.white),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => PokemonTypeFilterDialog(homeViewModel: widget.homeViewModel),
                );
              },
            ),
          ],
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
                  pokemonsList: widget.homeViewModel.filteredPokemons.toList(),
                  scrollController: widget.scrollController,
                  homeViewModel: widget.homeViewModel,
                ),
              ),
            ),
          ),
          widget.isLoading 
          ? const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                child: PokeballProgressIndicator(
                  pokeballSize: 50,
                  barRadius: 55,
                  strokeWidth: 10,
                ),
              ),
            )
          : Container(),
        ],
      ),
    );
  }
}