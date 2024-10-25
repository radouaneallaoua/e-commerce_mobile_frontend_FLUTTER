import 'package:chat_app/model/productcartmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCartItem extends StatefulWidget {
  ProductCart productCart;
  ProductCartItem({super.key, required this.productCart});

  @override
  State<ProductCartItem> createState() => _ProductCartItemState();
}

class _ProductCartItemState extends State<ProductCartItem> {
  late int currentQuantity;
  @override
  void initState() {
    currentQuantity = widget.productCart.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset(
                  widget.productCart.product.productImageURL,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Text(widget.productCart.product.productName),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(widget.productCart.product.price.toString()),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_circle)),
                      Text(currentQuantity.toString()),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                    ],
                  )
                ],
              ),
              IconButton(
                icon: Icon(
                  CupertinoIcons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  print("deleted");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
