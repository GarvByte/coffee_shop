import 'package:flutter/material.dart';
// import 'package:coffee_shop/pages/second_page.dart';

void main() {
  runApp(const FirstPage());
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Splash Screen',
      home: Scaffold(
        backgroundColor: Colors.grey[350],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/coffee-beans.png',
                height: 100,
                width: 100,
              ),

              Container(
                margin: EdgeInsets.only(bottom: 20, top: 30),
                child: Text(
                  "Brew Day",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 81, 50, 39),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "How do you like your coffee?",
                  style: TextStyle(color: Colors.brown),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color.fromARGB(255, 81, 50, 39),
                    padding: EdgeInsets.all(20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/second_page.dart');
                  },
                  child: Text(
                    "Enter Shop",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
