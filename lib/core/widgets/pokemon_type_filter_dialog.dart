import 'package:flutter/material.dart';
import '../../views/home/model/pokemon_model.dart';
import '../../views/home/viewModel/home_view_model.dart';
import '../colors/pokemon_type_colors.dart';
import 'gradient_text.dart';

class PokemonTypeFilterDialog extends StatefulWidget {
  const PokemonTypeFilterDialog({
    super.key, 
    required this.homeViewModel,
  });

  final HomeViewModel homeViewModel;

  @override
  PokemonTypeFilterDialogState createState() => PokemonTypeFilterDialogState();
}

class PokemonTypeFilterDialogState extends State<PokemonTypeFilterDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const GradientText(
        text: "Filter by Pokemon type",
        colors: [Colors.orange, Colors.red],
        style: TextStyle(fontSize: 20),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: (1/0.4),
          ),
          itemCount: PokemonTypes.values.length,
          itemBuilder: (context, index) {
            final PokemonTypes pokemonType = PokemonTypes.values[index];
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: pokemonTypeColors[pokemonType]!,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5, left: 5),
                    child: Text(
                      pokemonType.name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Checkbox(
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                    value: widget.homeViewModel.selectedPokemonTypes.contains(pokemonType),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) {
                          if (value) {
                            widget.homeViewModel.selectedPokemonTypes.add(pokemonType);
                          } else {
                            widget.homeViewModel.selectedPokemonTypes.remove(pokemonType);
                          }
                        }
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await widget.homeViewModel.filterPokemonsService();
            if(context.mounted) Navigator.of(context).pop();
          },
          child: const GradientText(
            text: "Filter",
            colors: [Colors.orange, Colors.red],
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}
