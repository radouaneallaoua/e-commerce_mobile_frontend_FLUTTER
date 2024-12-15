import 'package:e_commerce_app/model/productmodel.dart';
import 'package:e_commerce_app/product-details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  ProductModel productModel;
  Product({
    super.key,
    required this.productModel,
  });

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  late bool isSelected;
  @override
  void initState() {
    isSelected = widget.productModel.isFavorate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ProductDetailes(productModel: widget.productModel)));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Stack(
          children: [
            Column(
              children: [
                Hero(
                  tag: widget.productModel.productName,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Image.asset(
                      widget.productModel.productImageURL,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.productModel.productName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${widget.productModel.oldPrice.toString()}\$",
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      "${widget.productModel.price.toString()}\$",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: IconButton(
                tooltip: "add to favorites",
                icon: isSelected
                    ? const Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.red,
                      )
                    : const Icon(
                        CupertinoIcons.heart,
                      ),
                onPressed: () {
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text("product added to favorites"),
                      action: SnackBarAction(
                          label: "Ok",
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          }),
                    ));
                    isSelected = !isSelected;
                    widget.productModel.setIsFavorate(isSelected);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
