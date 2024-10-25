import 'package:chat_app/admin/allcategories.dart';
import 'package:chat_app/admin/productslist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int index = 0;
  List screens = [
    const ProductsListAdmin(),
    const AllCategoriesAdmin(),
    const Center(child: Text("Users"),),
    const Center(child: Text("Orders"),),
    const Center(child: Text("Statistics"),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("hello"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout,
                color: Colors.orange[600],
              ))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(4),
                      child: Column(children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Image.asset(
                              "assets/fruits.png",
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                index = 1;
                              });
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 700),
                                  curve: Curves.fastOutSlowIn,
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      color: index == 1
                                          ? const Color.fromARGB(
                                              255, 28, 120, 195)
                                          : Colors.white,
                                      borderRadius: index == 1
                                          ? const BorderRadius.only(
                                              topRight: Radius.circular(30),
                                              bottomRight: Radius.circular(30))
                                          : BorderRadius.circular(0)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.production_quantity_limits,
                                        color: (index == 1)
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Categories",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: index == 1
                                                ? Colors.white
                                                : Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                index = 2;
                              });
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 700),
                                  curve: Curves.fastOutSlowIn,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color: index == 2
                                          ? const Color.fromARGB(
                                              255, 28, 120, 195)
                                          : Colors.white,
                                      borderRadius: index == 2
                                          ? const BorderRadius.only(
                                              topRight: Radius.circular(30),
                                              bottomRight: Radius.circular(30))
                                          : BorderRadius.circular(0)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person_2,
                                        color: (index == 2)
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Users",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: index == 2
                                                ? Colors.white
                                                : Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                index = 3;
                              });
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 700),
                                  curve: Curves.fastOutSlowIn,
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: index == 3
                                          ? const Color.fromARGB(
                                              255, 28, 120, 195)
                                          : Colors.white,
                                      borderRadius: index == 3
                                          ? const BorderRadius.only(
                                              topRight: Radius.circular(30),
                                              bottomRight: Radius.circular(30))
                                          : BorderRadius.circular(0)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.cart_fill,
                                        color: (index == 3)
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Orders",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: index == 3
                                                ? Colors.white
                                                : Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                index = 4;
                              });
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 700),
                                  curve: Curves.fastOutSlowIn,
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: index == 4
                                          ? const Color.fromARGB(
                                              255, 28, 120, 195)
                                          : Colors.white,
                                      borderRadius: index == 4
                                          ? const BorderRadius.only(
                                              topRight: Radius.circular(30),
                                              bottomRight: Radius.circular(30))
                                          : BorderRadius.circular(0)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.cart_fill,
                                        color: (index == 4)
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Statistics",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: index == 4
                                                ? Colors.white
                                                : Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      ])),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset(
                          "assets/fruits.png",
                          width: 60,
                          height: 60,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text("Allaoua radouane")
                    ],
                  ),
                ])),
      ),
      body: Container(
        child:screens[index]
      
      ),
    );
  }
}
