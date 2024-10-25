import 'package:chat_app/categorylist.dart';
import 'package:chat_app/favorites.dart';
import 'package:chat_app/products.dart';
import 'package:chat_app/profile.dart';
import 'package:chat_app/shopping.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  List<Widget> screens = const [
    ProductsList(),
    CategoriesList(),
    Favorites(),
    Shopping(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      bottomNavigationBar: NavigationBar(

        height: 60,
        selectedIndex: index,
        
        onDestinationSelected: (newIndex) {
          setState(() {
            index = newIndex;
          });
        },
        destinations: const [
          NavigationDestination(
            tooltip: "Home",
            icon: Icon(CupertinoIcons.home),
            label: "Home",
            selectedIcon: Icon(
              CupertinoIcons.house_fill,
              color: Colors.orangeAccent,
            ),
          ),
          NavigationDestination(
            tooltip: "Categories",
            icon: Icon(CupertinoIcons.search),
            label: "Categories",
            selectedIcon: Icon(
              CupertinoIcons.search,
              color: Colors.orangeAccent,
            ),
          ),
          NavigationDestination(
            tooltip: "Favorites",
            icon: Icon(CupertinoIcons.heart),
            label: "Favorites",
            selectedIcon: Icon(
              CupertinoIcons.heart_solid,
              color: Colors.orangeAccent,
            ),
          ),
          NavigationDestination(
            tooltip: "Shopping cart",
              icon: Icon(CupertinoIcons.cart),
              label: "Shopping cart",
              selectedIcon: Icon(
                CupertinoIcons.cart_fill,
                color: Colors.orangeAccent,
              )),
          NavigationDestination(
           tooltip: "Profile", 
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
            selectedIcon: Icon(
              CupertinoIcons.person_solid,
              color: Colors.orangeAccent,
            ),
          ),
        ],
      ),
      body: screens[index],
    );
  }
}
