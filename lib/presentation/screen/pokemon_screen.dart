
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/presentation/screen/component/pokemon_grid_card.dart';
import 'package:pokedex_app/presentation/screen/utils.dart';

import '../cubit/pokemon_cubit.dart';
import '../cubit/pokemon_state.dart';

class PokemonScreen extends StatelessWidget{
  final String pokemonName;

  const PokemonScreen({super.key, required this.pokemonName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemonName.toUpperCase())),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PokemonLoaded) {
            Color backgroundColor = Utils.getColor(state.species.color);
            return Container(
              color: backgroundColor,
              child: Center(
                child: Text(
                  pokemonName.toUpperCase(),
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            );
          } else if (state is PokemonDataLoaded){
            return Padding(
                padding: EdgeInsets.all(16.0),
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1.2
                    ),
                    itemCount: state.pokemonDataList.length,
                    itemBuilder: (context, index){
                      final pokemon = state.pokemonDataList[index];
                      return PokemonGridCard(pokemonData: pokemon);
                    }
                ),
            );
          } else if(state is PokemonError){
            String message = state.message;
            return Center(child: Text("Error loading Pokémon : error $message"));
          }else{
            return Center(child: Text("Initial load"));
          }
        },
      ),
    );
  }

}