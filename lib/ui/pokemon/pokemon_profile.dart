import 'package:flutter/material.dart';
import 'package:parse_json_all/model/pokemon_model.dart';

class PokemonProfileUi extends StatefulWidget {
  Pokemon pokemon;

  PokemonProfileUi({this.pokemon});

  @override
  _PokemonProfileUiState createState() => _PokemonProfileUiState();
}

class _PokemonProfileUiState extends State<PokemonProfileUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 150.0,
            child: Center(
              child: Hero(
                tag: widget.pokemon.img,
                child: Image.network(widget.pokemon.img),
              ),
            ),
          )
        ],
      ),
    );
  }
}
