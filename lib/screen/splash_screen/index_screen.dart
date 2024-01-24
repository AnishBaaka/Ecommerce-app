import 'package:app/screen/bottom_navigation/add_to_cart_screen.dart';
import 'package:app/screen/bottom_navigation/home_screen.dart';
import 'package:app/screen/bottom_navigation/message_screen.dart';
import 'package:app/screen/bottom_navigation/settings_screen.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int currentIndex = 0;
  List<String> titles = ["Home", "Add To Cart", "Message", "Settings"];
  List<Widget> widgets = [
    const HomeScreen(),
    const AddToCartScreen(),
    const MessageScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 240, 237, 237),
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(titles[currentIndex]),
          centerTitle: true,
        ),
        body: widgets[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.deepOrange,
            type: BottomNavigationBarType.shifting,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_rounded), label: "Add to Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: "Inbox"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ]),
      ),
    );
  }
}
