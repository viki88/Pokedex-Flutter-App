
import 'package:equatable/equatable.dart';
import 'package:pokedex_app/data/models/pokemon_data_model.dart';
import 'package:pokedex_app/domain/pokemon_species.dart';

abstract class PokemonState extends Equatable{
  @override
  List<Object?> get props => [];
}

class PokemonInitial extends PokemonState{}

class PokemonLoading extends PokemonState{}

class PokemonLoaded extends PokemonState{
  final PokemonSpecies species;

  PokemonLoaded({required this.species});

  @override
  List<Object?> get props => [species];
}

class PokemonDataLoaded extends PokemonState{
  final List<PokemonData> pokemonDataList;

  PokemonDataLoaded({required this.pokemonDataList});

  @override
  List<Object?> get props => [pokemonDataList];

}

class PokemonError extends PokemonState{
  final String message;

  PokemonError({required this.message});

  @override
  List<Object?> get props => [message];
}