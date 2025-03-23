
import 'package:pokedex_app/domain/pokemon_species.dart';

class PokemonSpeciesModel extends PokemonSpecies{
  const PokemonSpeciesModel(super.id, {required super.color});

  factory PokemonSpeciesModel.fromJson(Map<String, dynamic> json){
    return PokemonSpeciesModel(json["id"], color: json["color"]["name"]);
  }

}