import 'package:chat_app/model/productcartmodel.dart';
import 'package:chat_app/productcart.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  ProductCart productCart;
  ShoppingCart({super.key,required this.productCart});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 128, 167, 187),
        title: const Text(
          "Shopping Cart",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ProductCartItem(productCart:widget.productCart);
            }),
      ),
    );
  }
}
