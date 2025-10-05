import 'package:flutter/material.dart';
import 'package:poke_app/features/home/data/models/pokemon_detail_response.dart';

class PokemonDetailScreen extends StatelessWidget {
  final PokemonDetailResponse pokemon;

  const PokemonDetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(pokemon.name)),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            pokemon.sprites.frontDefault ?? '',
            height: 200,
            fit: BoxFit.contain,
          ),
          Text('ID: ${pokemon.id}', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text('Height: ${pokemon.height}', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text('Weight: ${pokemon.weight}', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text(
            'Types: ${pokemon.types.map((type) => type.type.name).join(', ')}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
        ],
      ),
    ),
  );
}
