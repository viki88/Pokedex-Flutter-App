
import 'package:dartz/dartz.dart';
import 'package:pokedex_app/core/error/failures.dart';
import 'package:pokedex_app/core/error/usecase.dart';
import 'package:pokedex_app/data/models/pokemon_data_model.dart';
import 'package:pokedex_app/domain/repositories/pokemon_repositories.dart';

class GetPokemon extends UseCase<List<PokemonData>, NoParam>{

  final PokemonRepository pokemonRepository;

  GetPokemon({required this.pokemonRepository});

  @override
  Future<Either<Failure, List<PokemonData>>> call(NoParam params) async {
    return await pokemonRepository.getPokemon();
  }

}