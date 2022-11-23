import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/components/grocery_item_count.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:grocery_shop_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          ),
        ),
        child: Icon(Icons.shopping_bag),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text("Good Morning,", style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 15),
              child: Text(
                "Let's order fresh items for you",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Divider(
                thickness: 4,
              ),
            ),
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return GroceryItemCount(
                        itemName: value.ShopItems[index][0],
                        itemPrice: value.ShopItems[index][1],
                        imagePath: value.ShopItems[index][2],
                        color: value.ShopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false)
                              .addItemCart(index);
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
