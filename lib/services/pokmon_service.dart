import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:parse_json_all/model/pokemon_model.dart';

String url =
    "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

Future<PokemonList> getPokemons() async {
  var response = await http.get(url);
  print("getting response........");
  print(response.body);
  var jsonRes = json.decode(response.body);
  PokemonList pokemonList = PokemonList.fromJson(jsonRes);
  print("Pokemon length : " + pokemonList.pokemon.length.toString());
  return pokemonList;
}
