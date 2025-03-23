
class PokemonData{
  final String name;
  final String url;
  final String? color;
  final int? id;
  final List<String>? types;

  PokemonData({required this.name, required this.url, this.color, this.id ,this.types});

  factory PokemonData.fromJson(Map<String, dynamic> json){
    return PokemonData(name: json["name"], url: json["url"]);
  }

  static List<PokemonData> fromJsonList(List<dynamic> jsonList){
    return jsonList.map((json) => PokemonData.fromJson(json)).toList();
  }

  PokemonData copyWith({String? color, int? id, List<String>? types}){
    return PokemonData(name: name, url: url,
        color: color ?? this.color,
        id: id ?? this.id,
        types: types ?? this.types
    );
  }
  
  static List<String> fromJsonListToTypes(List<dynamic> jsonList){
    return jsonList.map((json) => json["type"]["name"].toString()).toList();
  }
}