
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pokedex_app/core/error/exceptions.dart';
import 'package:pokedex_app/data/models/pokemon_data_model.dart';
import 'package:pokedex_app/data/models/pokemon_species_model.dart';
import 'package:http/http.dart' as http;

abstract class PokemonRemoteDataSource{
  Future<PokemonSpeciesModel> getPokemonColor(String name);
  Future<List<PokemonData>> getPokemon();
  Future<List<String>> getPokemonTypes(String name);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource{
  final http.Client client;

  PokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<PokemonSpeciesModel> getPokemonColor(String name) async {
    final response = await client.get(Uri.parse("https://pokeapi.co/api/v2/pokemon-species/$name"));
    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200){
      return PokemonSpeciesModel.fromJson(jsonDecode(response.body));
    }else{
      throw ServerException();
    }
  }

  @override
  Future<List<PokemonData>> getPokemon() async {
    final response = await client.get(Uri.parse("https://pokeapi.co/api/v2/pokemon"));

    if (response.statusCode == 200){
      List<dynamic> jsonData = jsonDecode(response.body)["results"];
      List<PokemonData> pokemonDataList = PokemonData.fromJsonList(jsonData);

      List<Future<PokemonData>> futurePokemonDataList = pokemonDataList.map(
          (pokemonData) async {
            final pokemonColor = await getPokemonColor(pokemonData.name);
            final pokemonTypes = await getPokemonTypes(pokemonData.name);
            String color = pokemonColor.color;
            int id = pokemonColor.id;
            List<String> types = pokemonTypes;
            return pokemonData.copyWith(color: color, id: id, types: types);
          }
      ).toList();
      
      List<PokemonData> finalPokemonList = await Future.wait(futurePokemonDataList);

      return finalPokemonList;
    }else {
      throw ServerException();
    }
  }

  @override
  Future<List<String>> getPokemonTypes(String name) async{
    final response = await client.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$name"));

    if(response.statusCode == 200){
      List<dynamic> typeListJson = jsonDecode(response.body)["types"];
      List<String> types = PokemonData.fromJsonListToTypes(typeListJson);

      return types;
    }else{
      throw ServerException();
    }
  }

}