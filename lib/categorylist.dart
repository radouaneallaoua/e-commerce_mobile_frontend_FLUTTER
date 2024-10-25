import 'dart:ui';

import 'package:chat_app/categoryProducts.dart';
import 'package:chat_app/model/categorymodel.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategoryProducts(
                            categoryModel: CategoryModel(
                                categoryId: 1,
                                categoryName: "Fruits",
                                categoryImageURL: "assets/fruits.png"))));
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    height: 130,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/fruits.png",
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 60,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(151, 238, 238, 238),
                            ),
                            child: Center(
                              child: FittedBox(
                                child: Text(
                                  "Fruits",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 21, 59, 84),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            }),
      ),
    );
  }
}
