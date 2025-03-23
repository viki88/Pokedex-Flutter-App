
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/core/error/usecase.dart';
import 'package:pokedex_app/domain/usecase/get_pokemon.dart';
import 'package:pokedex_app/domain/usecase/get_pokemon_color.dart';
import 'package:pokedex_app/presentation/cubit/pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState>{

  final GetPokemonColor getPokemonColor;
  final GetPokemon getPokemon;

  PokemonCubit({required this.getPokemonColor, required this.getPokemon}) : super(PokemonInitial());

  Future<void> fetchPokemonColor(String name) async{

    emit(PokemonLoading());

    final result = await getPokemonColor(name);

    result.fold(
        (failure) => emit(PokemonError(message: failure.message)),
        (species) => emit(PokemonLoaded(species: species))
    );

  }
  
  Future<void> fetchPokemon() async{
    emit(PokemonLoading());
    
    final result = await getPokemon(NoParam());
    
    result.fold(
        (failure) => emit(PokemonError(message: failure.message)),
        (pokemonData) => emit(PokemonDataLoaded(pokemonDataList: pokemonData))
    );

  }


}