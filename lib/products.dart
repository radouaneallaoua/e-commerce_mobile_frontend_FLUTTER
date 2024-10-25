import 'dart:convert';

import 'package:chat_app/allCategories.dart';
import 'package:chat_app/categoryProducts.dart';
import 'package:chat_app/model/productmodel.dart';
import 'package:chat_app/model/categorymodel.dart';
import 'package:chat_app/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  late Future<List> categories;
  // Future<List> _fetchCategories() async {
  //   final url = Uri.parse('http://192.168.161.216:8000/categories');
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     return (json.decode(response.body) as List);
  //   } else {
  //     return Future(() => List.empty());
  //   }
  // }

  // @override
  // void initState() {
  //   categories = _fetchCategories();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.only(right: 10,left:10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              showSearch(
                  context: context,
                  delegate: ProductSearchDelegate(context: context));
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(123, 207, 207, 207)),
                  child: const Row(children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "search ...",
                      style: TextStyle(fontSize: 20),
                    )
                  ]),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 200,
              child: PageView(
                children: [
                  Image.asset(
                    "assets/intro3.png",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/intro3.png",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/intro3.png",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/intro3.png",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/intro3.png",
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Latest products",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          
          Expanded(
            child: GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Product(
                    productModel: ProductModel(
                        productId: index,
                        productName: "product $index",
                        productDescription:
                            "this is a description for the nest product and something else that you don't know about the product $index",
                        productImageURL: "assets/intro3.png",
                        oldPrice: 50,
                        price: 40),
                  );
                }),
          )
        ],
      ),
    ));
  }
}

class ProductSearchDelegate extends SearchDelegate {
  late BuildContext context;
  ProductSearchDelegate({required this.context});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Tooltip(
        message: "filter with other criteria",
        child: IconButton(
            onPressed: () {
              Scaffold.of(context).showBottomSheet((context) => const SizedBox(
                    height: 100,
                    width: double.infinity,
                  ));
            },
            icon: const Icon(Icons.filter_alt_sharp)),
      ),
      Tooltip(
        message: "clear search",
        child: IconButton(
            onPressed: () {
              query = "";
            },
            icon: const Icon(Icons.cancel)),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Tooltip(
      message: "back",
      child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios)),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(
            30,
            (index) => const ListTile(
                  title: Text("Test"),
                ))
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(scrollDirection: Axis.vertical, children: [
          Column(
            children: [
              SizedBox(
                height: 85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                        4,
                        (index) => GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 5, 80, 142)),
                                ),
                                height: 80,
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.euro,
                                        color: Colors.blue[300],
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      const Text(
                                        "By price",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 7, 127, 167)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...List.generate(
                      4,
                      (index) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: const Color.fromARGB(255, 5, 80, 142)),
                            ),
                            height: 80,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.euro,
                                    color: Colors.blue[300],
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  const Text(
                                    "By price",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 7, 127, 167)),
                                  )
                                ],
                              ),
                            ),
                          ))
                ],
              ),
            ],
          ),
        ]));
  }
}
