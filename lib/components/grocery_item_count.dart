import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroceryItemCount extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  GroceryItemCount(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color[100],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(imagePath, height: 85),
              Text(
                itemName,
                style: GoogleFonts.notoSerif(
                  fontSize: 20,
                ),
              ),
              MaterialButton(
                onPressed: onPressed,
                color: color[800],
                child: Text(
                  "\$" + itemPrice,
                  style: GoogleFonts.notoSerif(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
