import 'package:flutter/material.dart';

import '../../views/home/model/pokemon_model.dart';

final Map<PokemonTypes, List<Color>> pokemonTypeColors = {
  PokemonTypes.normal: [Colors.brown, Colors.grey],
  PokemonTypes.fire: [Colors.red, Colors.orange],
  PokemonTypes.water: [Colors.blue, Colors.lightBlue],
  PokemonTypes.grass: [Colors.green, Colors.lightGreen],
  PokemonTypes.electric: [Colors.orange, Colors.orange[300]!],
  PokemonTypes.ice: [Colors.blueGrey, Colors.lightBlue],
  PokemonTypes.fighting: [Colors.red, Colors.redAccent],
  PokemonTypes.poison: [Colors.purple, Colors.purpleAccent],
  PokemonTypes.ground: [Colors.brown, Colors.orange[800]!],
  PokemonTypes.flying: [Colors.purple[300]!, Colors.purple[100]!],
  PokemonTypes.psychic: [Colors.pink, Colors.pinkAccent],
  PokemonTypes.bug: [Colors.lime, Colors.lightGreen[300]!],
  PokemonTypes.rock: [Colors.brown, Colors.brown[300]!],
  PokemonTypes.ghost: [Colors.deepPurple, Colors.purple],
  PokemonTypes.dragon: [Colors.indigo, Colors.indigoAccent],
  PokemonTypes.steel: [Colors.blueGrey, Colors.blueGrey[300]!],
  PokemonTypes.dark: [Colors.brown[800]!, Colors.black],
  PokemonTypes.fairy: [Colors.pink[300]!, Colors.pink[100]!],
};