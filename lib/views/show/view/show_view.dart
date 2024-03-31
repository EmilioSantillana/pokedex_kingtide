import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

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
  late List<Color> _currentColors;

  @override
  void initState() {
    super.initState();
    _showViewModel = ShowViewModel(PokemonService(DioManager.instance.dio), widget.pokemon, widget.homeViewModel);
    _currentColors = pokemonTypeColors[_showViewModel.pokemon.types!.first]!;
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
                      colors: _currentColors,
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
              body: Card(
                surfaceTintColor: _currentColors[0],
                elevation: 5,
                shadowColor: _currentColors[1],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: SizedBox(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Spacer(),
                            Column(
                              children: [
                                GradientText(
                                  text: "${_showViewModel.pokemon.id}",
                                  colors: _currentColors,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                for (var type in _showViewModel.pokemon.types!)
                                  Container(
                                    width: 80,
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: pokemonTypeColors[type]!,
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Text(
                                      type.name.toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 8,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: _showViewModel.pokemon.svgUrl != null 
                            ? SvgPicture.network(
                                _showViewModel.pokemon.svgUrl!,
                                fit: BoxFit.contain,
                              )
                            : Center(
                                child: GradientText(
                                  text: "NO IMAGE",
                                  colors: _currentColors,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GradientText(
                                  text: "Height: ${_showViewModel.pokemon.height}dm",
                                  colors: _currentColors,
                                  style: const TextStyle(fontSize: 10),
                                ),
                                GradientText(
                                  text: "Weight: ${_showViewModel.pokemon.weight}hg",
                                  colors: _currentColors,
                                  style: const TextStyle(fontSize: 10),
                                ),
                                GradientText(
                                  text: "Happiness: ${_showViewModel.pokemon.baseHappiness}",
                                  colors: _currentColors,
                                  style: const TextStyle(fontSize: 10),
                                ),
                                GradientText(
                                  text: "Capture rate: ${_showViewModel.pokemon.captureRate}",
                                  colors: _currentColors,
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        GradientText(
                          text: _showViewModel.pokemon.flavorText!,
                          colors: _currentColors,
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        GradientText(
                          text: "Base stats:",
                          colors: _currentColors,
                          style: const TextStyle(fontSize: 25),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GradientText(
                          text: "HP: ${_showViewModel.pokemon.baseHp}",
                          colors: _currentColors,
                          style: const TextStyle(fontSize: 15),
                        ),
                        GradientText(
                          text: "Attack: ${_showViewModel.pokemon.baseAttack}",
                          colors: _currentColors,
                          style: const TextStyle(fontSize: 15),
                        ),
                        GradientText(
                          text: "Defense: ${_showViewModel.pokemon.baseDefense}",
                          colors: _currentColors,
                          style: const TextStyle(fontSize: 15),
                        ),
                        GradientText(
                          text: "Special attack: ${_showViewModel.pokemon.baseSpecialAttack}",
                          colors: _currentColors,
                          style: const TextStyle(fontSize: 15),
                        ),
                        GradientText(
                          text: "Special defense: ${_showViewModel.pokemon.baseSpecialDefense}",
                          colors: _currentColors,
                          style: const TextStyle(fontSize: 15),
                        ),
                        GradientText(
                          text: "Speed: ${_showViewModel.pokemon.baseSpeed}",
                          colors: _currentColors,
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        _showViewModel.pokemon.pokemonEvolutions!.length > 1  
                          ? Column(
                            children: [
                              GradientText(
                                text: "Evolution chain",
                                colors: _currentColors,
                                style: const TextStyle(fontSize: 25),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, bottom: 10),
                                child: SizedBox(
                                  height: 300,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _showViewModel.pokemon.pokemonEvolutions!.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Row(
                                        children: [
                                          Column(
                                            children: [
                                              GradientText(
                                                text: _showViewModel.pokemon.pokemonEvolutions!.toList()[index].id!.toString(),
                                                colors: _currentColors,
                                                style: const TextStyle(fontSize: 20),
                                              ),
                                              SizedBox(
                                                height: 200,
                                                width: 200,
                                                child: _showViewModel.pokemon.pokemonEvolutions!.toList()[index].svgUrl != null 
                                                  ? SvgPicture.network(
                                                      _showViewModel.pokemon.pokemonEvolutions!.toList()[index].svgUrl!,
                                                      fit: BoxFit.contain,
                                                    )
                                                  : Center(
                                                      child: GradientText(
                                                        text: "NO IMAGE",
                                                        colors: _currentColors,
                                                        style: const TextStyle(fontSize: 20),
                                                      ),
                                                    ),
                                              ),
                                              GradientText(
                                                text: _showViewModel.pokemon.pokemonEvolutions!.toList()[index].name!.toUpperCase(),
                                                colors: _currentColors,
                                                style: const TextStyle(fontSize: 20),
                                              ),
                                              Column(
                                                children: [
                                                  for (var type in _showViewModel.pokemon.pokemonEvolutions!.toList()[index].types!)
                                                    Container(
                                                      width: 80,
                                                      alignment: Alignment.center,
                                                      margin: const EdgeInsets.only(bottom: 5),
                                                      decoration: BoxDecoration(
                                                        gradient: LinearGradient(
                                                          colors: pokemonTypeColors[type]!,
                                                          begin: Alignment.topLeft,
                                                          end: Alignment.bottomRight,
                                                        ),
                                                      ),
                                                      child: Text(
                                                        type.name.toUpperCase(),
                                                        style: const TextStyle(
                                                          fontSize: 8,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          index+1 < _showViewModel.pokemon.pokemonEvolutions!.length 
                                            ? const Icon(
                                              Icons.arrow_forward,
                                              size: 100,
                                            )
                                            : Container()
                                        ],
                                      ); 
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                          : Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 50),
                            child: GradientText(
                                text: "No evolution chain",
                                colors: _currentColors,
                                style: const TextStyle(fontSize: 20),
                              ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          case PokemonServiceState.error:
            
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}