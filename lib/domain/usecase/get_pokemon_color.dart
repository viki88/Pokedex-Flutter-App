
import 'package:dartz/dartz.dart';
import 'package:pokedex_app/core/error/failures.dart';
import 'package:pokedex_app/core/error/usecase.dart';
import 'package:pokedex_app/domain/pokemon_species.dart';
import 'package:pokedex_app/domain/repositories/pokemon_repositories.dart';

class GetPokemonColor extends UseCase<PokemonSpecies, String>{
  
  final PokemonRepository pokemonRepository;

  GetPokemonColor({required this.pokemonRepository});

  @override
  Future<Either<Failure, PokemonSpecies>> call(String param) async {
      return await pokemonRepository.getPokemonColor(param);
  }

}