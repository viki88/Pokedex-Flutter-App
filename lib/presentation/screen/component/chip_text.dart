
import 'package:flutter/material.dart';
import 'package:pokedex_app/presentation/screen/utils.dart';

class ChipText extends StatelessWidget {
  final String type;
  final String? color;

  const ChipText({super.key, required this.type, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(2),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Utils.getTransparentBackground(color), // Semi-transparent background
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          type,
          style: TextStyle(
              fontSize: 10,
              color: Utils.getFontColor(color).withAlpha(180)
          ), // Adjust text color
        ),
      ),
    );
  }
}
