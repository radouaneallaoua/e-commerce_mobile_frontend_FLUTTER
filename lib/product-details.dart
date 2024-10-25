import 'package:chat_app/model/productmodel.dart';
import 'package:chat_app/model/productcartmodel.dart';
import 'package:chat_app/product.dart';
import 'package:chat_app/product.dart';
import 'package:chat_app/shoppingcart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetailes extends StatefulWidget {
  ProductModel productModel;

  ProductDetailes({
    super.key,
    required this.productModel,
  });

  @override
  State<ProductDetailes> createState() => _ProductDetailesState();
}

class _ProductDetailesState extends State<ProductDetailes> {
  late bool isSelected;
  int numberOfStars = 5;
  int productQuantity = 1;
  @override
  void initState() {
    isSelected = widget.productModel.isFavorate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(176, 3, 135, 243),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(widget.productModel.productName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            )),
        centerTitle: true,
        actions: [
          IconButton(
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
                isSelected = !isSelected;
                widget.productModel.setIsFavorate(isSelected);
              });
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Expanded(
          flex: 1,
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Hero(
                  tag: widget.productModel.productName,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Image.asset(
                      widget.productModel.productImageURL,
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.productModel.productName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.productModel.productDescription,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(
                          5,
                          (index) => IconButton(
                              onPressed: () {
                                setState(() {
                                  numberOfStars = index;
                                });
                              },
                              icon: Icon(Icons.star,
                                  color: numberOfStars >= index
                                      ? const Color.fromARGB(255, 225, 210, 80)
                                      : Colors.grey)))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${widget.productModel.oldPrice.toString()}\$",
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
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
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton.filled(
                          color: Colors.grey,
                          onPressed: () {
                            if (productQuantity != 0) {
                              setState(() {
                                productQuantity--;
                              });
                            }
                          },
                          icon: const Icon(Icons.remove)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          productQuantity.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton.filled(
                          color: Colors.grey,
                          onPressed: () {
                            setState(() {
                              productQuantity++;
                            });
                          },
                          icon: const Icon(Icons.add)),
                    ],
                  ),
                  Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => ShoppingCart(
                        //           productCart: ProductCart(
                        //               product: widget.productModel,
                        //               quantity: productQuantity),
                        //         )));
                        print("hello");
                        Scaffold.of(context).showBottomSheet((context) {
                          return SizedBox(
                            height: 100,
                            child: ColoredBox(color: Colors.black),
                          );
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          // width: 100,
                          // height: 50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration:
                              const BoxDecoration(color: Colors.deepOrange),
                          child: const Center(
                              child: Text(
                            "add to cart",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                        ),
                      ),
                    );
                  })
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Similar products",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "View All",
                        style: TextStyle(color: Colors.orangeAccent),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 350,
                child: GridView.builder(
                    itemCount: 20,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Product(
                        productModel: ProductModel(
                            productId: index,
                            productName: "product ${index + 1000}",
                            productDescription:
                                "this is a description for the nest product and something else that you don't know about the product $index",
                            productImageURL: "assets/intro3.png",
                            oldPrice: 50,
                            price: 40),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
