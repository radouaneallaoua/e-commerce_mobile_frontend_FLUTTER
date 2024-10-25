import 'package:chat_app/model/productmodel.dart';
import 'package:chat_app/model/categorymodel.dart';
import 'package:chat_app/product.dart';
import 'package:flutter/material.dart';

class CategoryProducts extends StatefulWidget {
  CategoryModel categoryModel;
  CategoryProducts({super.key, required this.categoryModel});

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 157, 198, 231),
        title: Text(
          widget.categoryModel.categoryName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        
        child: GridView.builder(
          padding: const EdgeInsets.only(bottom: 100),
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
      ),
    );
  }
}
