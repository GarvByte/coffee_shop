import 'package:flutter/material.dart';
// import 'package:coffee_shop/pages/second_page.dart';
import 'package:coffee_shop/pages/cart.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  int quantity = 0;
  bool isselected = false;
  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    setState(() {
      quantity == 0 ? null : quantity--;
      // counter--;
    });
  }

  int _selectedIndex = 0;
  void navbar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> size = ["S", "M", "L"];
  String selectedIndex = 'A';
  bool selectedQty = false;
  int sizeindex = 0;

  void quantitySelection() {
    setState(() {
      selectedQty = selectedIndex == size[sizeindex];
    });
  }

  late String cartItem;

  @override
  Widget build(BuildContext context) {
    final coffeedata = ModalRoute.of(context)!.settings.arguments as Map;
    print('Loading image: ${coffeedata['image']}');
    print("selected index $selectedIndex");

    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 40),

              child: Image.asset(coffeedata['image'], height: 100),
            ),
            Text("Q U A N T I T Y"),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      decrement();
                    },
                    icon: Icon(Icons.remove),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    margin: EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 20,
                      bottom: 20,
                    ),

                    child: Text(
                      "$quantity",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      increment();
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Text("S I Z E"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == 'S' ? Colors.brown : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: GestureDetector(
                    child: Text(
                      size[0],
                      style: TextStyle(
                        color:
                            selectedIndex == 'S' ? Colors.white : Colors.black,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedIndex = size[0];
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: selectedIndex == 'M' ? Colors.brown : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: GestureDetector(
                    child: Text(
                      size[1],
                      style: TextStyle(
                        color:
                            selectedIndex == 'M' ? Colors.white : Colors.black,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedIndex = size[1];
                      });
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == 'L' ? Colors.brown : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: GestureDetector(
                    child: Text(
                      size[2],
                      style: TextStyle(
                        color:
                            selectedIndex == 'L' ? Colors.white : Colors.black,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedIndex = size[2];
                      });
                    },
                  ),
                ),
              ],
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
                onPressed: () {
                  cartItem = coffeedata['coffeeName'];
                  // print("items: $cartItem");
                  Cart.cartItems.add(cartItem);
                  Cart.cartItemsPrice.add(coffeedata['price']);
                  Cart.cartItemsQuantity.add(quantity);
                  Cart.cartItemsImages.add(coffeedata['image']);
                  Navigator.pushNamed(context, "/second_page.dart");
                },
                child: Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 241, 241),
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
