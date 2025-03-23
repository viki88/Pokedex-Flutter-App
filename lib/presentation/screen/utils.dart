
import 'package:flutter/material.dart';

class Utils{

  static Color getColor(String? color) {
    return {
      "black": Colors.black,
      "pink":Colors.pinkAccent,
      "brown":Colors.brown,
      "red": Colors.red,
      "blue": Colors.blue,
      "yellow": Colors.yellow,
      "green": Colors.green,
      "purple": Colors.purple,
      "gray": Colors.grey,
    }[color] ?? Colors.white;
  }

  static String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  static Color getFontColor(String? color){
    if(color == "white" || color == "yellow"){
      return Colors.black;
    }else {
      return Colors.white;
    }
  }

  static String getPokeballAsset(String? color){
    if(color == "white" || color == "yellow"){
      return 'assets/pokeball_icon_black.png';
    }else {
      return 'assets/pokeball_icon_white.png';
    }
  }

  static Color getTransparentBackground(String? color){
    if(color == "white" || color == "yellow"){
      return Colors.black.withAlpha(20);
    }else {
      return Colors.white.withAlpha(20);
    }
  }

}