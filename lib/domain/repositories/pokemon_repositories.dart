
import 'package:dartz/dartz.dart';
import 'package:pokedex_app/core/error/failures.dart';
import 'package:pokedex_app/data/models/pokemon_data_model.dart';
import 'package:pokedex_app/domain/pokemon_species.dart';

abstract class PokemonRepository{
  Future<Either<Failure, PokemonSpecies>> getPokemonColor(String name);
  Future<Either<Failure, List<PokemonData>>> getPokemon();
}