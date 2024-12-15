import 'package:e_commerce_app/admin/all_brands_admin.dart';
import 'package:e_commerce_app/admin/all_colors_admin.dart';
import 'package:e_commerce_app/admin/all_orders_admin.dart';
import 'package:e_commerce_app/admin/all_sizes_admin.dart';
import 'package:e_commerce_app/admin/allcategories.dart';
import 'package:e_commerce_app/admin/dashboard.dart';
import 'package:e_commerce_app/admin/productslist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/admin/users_for_admin.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _index = 0;
  List screens = [
    {
      'name': "Dashboard",
      'icon': CupertinoIcons.chart_bar_square_fill,
      'screen': const Dashboard()
    },
    {
      'name': "Orders",
      'icon': CupertinoIcons.doc_plaintext,
      'screen': const AllOrders()
    },
    {
      'name': "Products",
      'icon': CupertinoIcons.cube_box,
      'screen': const ProductsListAdmin()
    },
    {
      'name': "Categories",
      'icon': CupertinoIcons.circle_grid_3x3_fill,
      'screen': const AllCategoriesAdmin()
    },
    {
      'name': "Sizes",
      'icon': CupertinoIcons.zoom_in,
      'screen': const SizesPage()
    },
    {
      'name': "Brands",
      'icon': CupertinoIcons.bookmark,
      'screen': const AllBrands()
    },
    {
      'name': "Colors",
      'icon': CupertinoIcons.color_filter,
      'screen': const AllColors()
    },
    {
      'name': "Users",
      'icon': CupertinoIcons.person_2,
      'screen': const AllUsers()
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("hello admin"),
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
              Expanded(
                child: ListView.builder(
                  itemCount: screens.length,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _index = index;
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
                                color: _index == index
                                    ? const Color.fromARGB(255, 28, 120, 195)
                                    : Colors.white,
                                borderRadius: _index == index
                                    ? const BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomRight: Radius.circular(30))
                                    : BorderRadius.circular(0)),
                            child: Row(
                              children: [
                                Icon(
                                  screens[index]["icon"],
                                  color: (_index == index)
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  screens[index]["name"],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: _index == index
                                          ? Colors.white
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ),
              ),
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
              )
            ])),
      ),
      body: Container(child: screens[_index]["screen"]),
    );
  }
}
