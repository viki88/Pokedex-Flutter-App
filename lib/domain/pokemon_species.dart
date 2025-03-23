
import 'package:equatable/equatable.dart';

class PokemonSpecies extends Equatable{

  final String color;
  final int id;

  const PokemonSpecies(this.id, {required this.color});

  @override
  List<Object?> get props => [color];

}