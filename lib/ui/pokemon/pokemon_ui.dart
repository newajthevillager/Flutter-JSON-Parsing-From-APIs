import 'package:flutter/material.dart';
import 'package:parse_json_all/model/pokemon_model.dart';
import 'package:parse_json_all/services/pokmon_service.dart';
import 'package:parse_json_all/ui/pokemon/pokemon_profile.dart';

class PokemonUi extends StatefulWidget {
  @override
  _PokemonUiState createState() => _PokemonUiState();
}

class _PokemonUiState extends State<PokemonUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getPokemons(),
        builder: (context, snap) {
          if (snap.hasData) {
            return ListView.builder(
              itemCount: snap.data.pokemon.length,
              itemBuilder: (context, index) {
                Pokemon pokemon = snap.data.pokemon[index];
                return ListTile(
                  leading: Hero(
                    tag: pokemon.img,
                    child: CircleAvatar(
                      child: Image.network(pokemon.img),
                    ),
                  ),
                  title: Text(pokemon.name),
                  subtitle: Text(pokemon.egg),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PokemonProfileUi(
                        pokemon: pokemon,
                      );
                    }));
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
