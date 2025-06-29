// import 'package:coffee_shop/pages/fourth_page.dart';
import 'package:coffee_shop/pages/cart.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<String> names = [
    'Long Black',
    'Cappuccino',
    'White Latte',
    'Cold Cofee',
  ];

  List<int> price = [200, 250, 149, 999];

  List<String> img = [
    "assets/images/coffee-cup.png",
    "assets/images/coffee.png",
    "assets/images/latte-art.png",
    "assets/images/coffee-cup (1).png",
  ];
  int _selectedIndex = 0;
  void navbar(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.pushNamed(context, '/fourth_page.dart');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> finalCart = Cart.cartItems;
    print("final list : $finalCart");
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey[350]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 50)),
                Image.asset("assets/images/coffee-beans.png", height: 100),
              ],
            ),
            Text(
              "Brew Day",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.brown[900],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text("Home", style: TextStyle(color: Colors.brown[900])),
              leading: Icon(Icons.home, color: Colors.brown),
              onTap: () {
                Navigator.pushNamed(context, '/first_page.dart');
              },
            ),
            ListTile(
              title: Text("Cart", style: TextStyle(color: Colors.brown[900])),
              leading: Icon(Icons.shopping_cart, color: Colors.brown),
              onTap: () {
                Navigator.pushNamed(context, '/fourth_page.dart');
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[350],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Text(
              "How do you like your coffee?",
              style: TextStyle(color: Colors.brown[900], fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (BuildContext context, int itemNumber) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 232, 226, 226),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(names[itemNumber]),
                    subtitle: Text("\$ ${price[itemNumber].toString()}"),
                    leading: Image.asset(img[itemNumber]),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // print("selected item = ${names[itemNumber]}");

                      Navigator.pushNamed(
                        context,
                        '/third_page.dart',
                        arguments: {
                          'coffeeName': names[itemNumber],
                          'image': img[itemNumber],
                          'price': price[itemNumber],
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(30),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: navbar,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.brown,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined),
              label: "cart",
            ),
          ],
          showSelectedLabels: true,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
