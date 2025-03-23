
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_app/data/models/pokemon_data_model.dart';
import 'package:pokedex_app/presentation/screen/component/chip_text.dart';
import 'package:pokedex_app/presentation/screen/utils.dart';

class PokemonGridCard extends StatelessWidget {
  final PokemonData pokemonData;

  const PokemonGridCard({super.key, required this.pokemonData});

  @override
  Widget build(BuildContext context) {
    Color color = Utils.getFontColor(pokemonData.color);

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
      ),
      color: Utils.getColor(pokemonData.color),
      elevation: 4,
      child: Stack(
        children: [
          Positioned(
            top :10,
              right :10,
              child: Opacity(
                  opacity: 0.5,
                child: Text(
                  "#${pokemonData.id.toString().padLeft(3,'0')}",
                  style: GoogleFonts.fugazOne(
                    textStyle: TextStyle(
                      fontSize: 18
                    )
                  ),
                ),
              )
          ),
          Positioned(
              bottom: -20,
              right: -20,
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  width: 130,
                    height: 130,
                    Utils.getPokeballAsset(pokemonData.color)
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.all(16.0),
            child: Text(
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: color,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                )
              ),
                Utils.capitalizeFirstLetter(pokemonData.name)
            ),
          ),
          Positioned(
            top: 45,
              left: 16,
              child: Column(
                children: List.generate(
                    pokemonData.types!.length, (subIndex) =>
                    ChipText(type: pokemonData.types![subIndex], color: pokemonData.color)
                ),
              )
          ),
          Positioned(
            bottom: 0,
              right: 0,
              child: Image.network(
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemonData.id}.png",
                width: 110,
                height: 110,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const CircularProgressIndicator();
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported, size: 50);
                },
              )
          )
        ],
      ),
    );
  }
}

