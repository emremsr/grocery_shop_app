import 'package:flutter/material.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:grocery_shop_app/pages/home_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ),
          ),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("My Cart"),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.CartItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ListTile(
                          leading: Image.network(value.CartItems[index][2],
                              fit: BoxFit.cover, height: 40),
                          title: Text(value.CartItems[index][0]),
                          subtitle: Text(
                            "\$ " + value.CartItems[index][1],
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                return Provider.of<CartModel>(context,
                                        listen: false)
                                    .removeItemCart(index);
                              },
                              icon: Icon(Icons.cancel),
                              color: Colors.red),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              value.calculateTotal(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white)),
                          child: Row(
                            children: [
                              Text("Pay Now",
                                  style: TextStyle(color: Colors.white)),
                              Icon(
                                Icons.double_arrow,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
