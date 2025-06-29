// import 'package:coffee_shop/main.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/pages/cart.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    List names = Cart.cartItems;
    List quantity = Cart.cartItemsQuantity;
    List price = Cart.cartItemsPrice;
    List image = Cart.cartItemsImages;

    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(backgroundColor: Colors.grey[350]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Text(
              "Here is your cart",
              style: TextStyle(color: Colors.brown[900], fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 232, 226, 226),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(names[index]),
                    subtitle: Text("qty. ${quantity[index]}"),
                    leading: Image.asset(image[index]),
                    trailing: Text(
                      "\$ ${price[index]}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: const Color.fromARGB(255, 81, 50, 39),
                padding: EdgeInsets.all(20),
              ),
              onPressed: () {},
              child: Text("Pay Now", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
