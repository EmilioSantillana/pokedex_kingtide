import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/colors/pokemon_type_colors.dart';
import '../../../core/network/dio_manager.dart';
import '../../../core/services/pokemon_service.dart';
import '../../../core/services/pokemon_service_state.dart';
import '../../../core/widgets/gradient_text.dart';
import '../../../core/widgets/pokeball_progress_indicator.dart';
import '../../home/model/pokemon_model.dart';
import '../../home/viewModel/home_view_model.dart';
import '../viewModel/show_view_model.dart';

class ShowView extends StatefulWidget {
  const ShowView({
    super.key, 
    required this.pokemon, 
    required this.homeViewModel
  });

  final PokemonModel pokemon;
  final HomeViewModel homeViewModel;

  @override
  State<ShowView> createState() => _ShowViewState();
}

class _ShowViewState extends State<ShowView> {
  late ShowViewModel _showViewModel;

  @override
  void initState() {
    super.initState();
    _showViewModel = ShowViewModel(PokemonService(DioManager.instance.dio), widget.pokemon, widget.homeViewModel);
    _showViewModel.fetchPokemonService();
  }

  @override
  Widget build(BuildContext context) {
    return _buildHomeView();
  }

  Observer _buildHomeView() {
    return Observer(
      builder: (_) {
        switch (_showViewModel.pokemonServiceState) {
          case PokemonServiceState.loading:
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
                      text: "Loading Pokemon...",
                      colors: [Colors.red, Colors.orange],
                    ),
                  ],
                ),
              ),
            );
          case PokemonServiceState.success:
            return Scaffold(
              appBar: AppBar(
                flexibleSpace: Container(
                  decoration:BoxDecoration(
                    gradient: LinearGradient(
                      colors: pokemonTypeColors[_showViewModel.pokemon.types!.first]!,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                title: Text(
                  _showViewModel.pokemon.name!.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
              body: Container(),
            );
          case PokemonServiceState.error:
            
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}