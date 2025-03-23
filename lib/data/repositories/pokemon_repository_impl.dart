
import 'package:dartz/dartz.dart';
import 'package:pokedex_app/core/error/exceptions.dart';
import 'package:pokedex_app/core/error/failures.dart';
import 'package:pokedex_app/data/source/pokemon_remote_data_source.dart';
import 'package:pokedex_app/domain/pokemon_species.dart';
import 'package:pokedex_app/domain/repositories/pokemon_repositories.dart';

import '../models/pokemon_data_model.dart';

class PokemonRepositoryImpl implements PokemonRepository{

  final PokemonRemoteDataSource dataSource;

  PokemonRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, PokemonSpecies>> getPokemonColor(String name) async {

    try{
      final result = await dataSource.getPokemonColor(name);
      return Right(result);
    }catch(e){
        return Left(ServerFailure(message: e.toString()));
    }

  }

  @override
  Future<Either<Failure, List<PokemonData>>> getPokemon() async {
    try{
      final result = await dataSource.getPokemon();
      return Right(result);
    }catch(e){
      return Left(ServerFailure(message: e.toString()));
    }
  }

}