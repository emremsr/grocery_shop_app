import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 25, right: 25, bottom: 20, top: 100),
            child: Image.network(
              width: 200,
              height: 200,
              "https://cdn-icons-png.flaticon.com/128/869/869457.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              textAlign: TextAlign.center,
              "We deliver grocery at your doorstep",
              style: GoogleFonts.notoSerif(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 30, left: 30, top: 20, bottom: 30),
            child: Text(
              textAlign: TextAlign.center,
              "Groceer gives you fresh vegetables and fruits, Order fresh items from groceer",
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.deepPurple,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
                  },
                ),
              );
            },
            child: Text("Get Started"),
          )
        ],
      ),
    );
  }
}
