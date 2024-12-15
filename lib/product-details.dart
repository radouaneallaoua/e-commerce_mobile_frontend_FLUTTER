import 'package:e_commerce_app/commets.dart';
import 'package:e_commerce_app/model/productmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

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
  int selectedColorIndexForProduct = 0;

  bool favorited = true;
  List productColors = [
    Colors.blue,
    Colors.black,
    Colors.orange,
  ];

  List productSizes = [
    {"id": 0, "label": "XXL"},
    {"id": 1, "label": "XL"},
    {"id": 2, "label": "L"},
  ];
  int selectedSize = 0;
  @override
  void initState() {
    isSelected = widget.productModel.isFavorate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                SizedBox(
                  height: 300,
                  child: PageView(children: [
                    ...List.generate(
                      4,
                      (index) => ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          widget.productModel.productImageURL,
                          width: 250,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ]),
                ),
                Container(
                    margin: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              color: Colors.black38,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Text.rich(TextSpan(
                              text: "1000 ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 213, 0),
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text: "stars",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ))
                              ])),
                        )
                      ],
                    ))
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.blue[50],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            widget.productModel.productName,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            widget.productModel.productDescription,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
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
                                                ? const Color.fromARGB(
                                                    255, 225, 210, 80)
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "colors",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Wrap(
                                  runAlignment: WrapAlignment.start,
                                  children: [
                                    ...List.generate(
                                        productColors.length,
                                        (index) => GestureDetector(
                                              onTap: () => {
                                                setState(() {
                                                  selectedColorIndexForProduct =
                                                      index;
                                                })
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                margin:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  border:
                                                      selectedColorIndexForProduct ==
                                                              index
                                                          ? Border.all(
                                                              width: 2,
                                                              color: const Color
                                                                  .fromARGB(255,
                                                                  3, 255, 11))
                                                          : null,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1000),
                                                  color: productColors[index],
                                                ),
                                                child: const SizedBox(),
                                              ),
                                            ))
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "sizes",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Wrap(
                                  runAlignment: WrapAlignment.start,
                                  children: [
                                    ...List.generate(
                                        productSizes.length,
                                        (index) => GestureDetector(
                                              onTap: () => {
                                                setState(() {
                                                  selectedSize =
                                                      productSizes[index]["id"];
                                                })
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                margin:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: selectedSize ==
                                                          productSizes[index]
                                                              ["id"]
                                                      ? Colors.blue[300]
                                                      : Colors.blue[50],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                      productSizes[index]
                                                          ["label"]),
                                                ),
                                              ),
                                            ))
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${productQuantity * widget.productModel.price}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        productQuantity++;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Center(
                                        child: Text(
                                          "+",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "$productQuantity",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (productQuantity > 1) {
                                        setState(() {
                                          productQuantity--;
                                        });
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 8),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: const Center(
                                        child: Text(
                                          "-",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Builder(builder: (context) {
                              return MaterialButton(
                                  animationDuration: const Duration(seconds: 2),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Colors.black,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => const Comments()));
                                  },
                                  child: const Text(
                                    "10 comments",
                                    style: TextStyle(color: Colors.white),
                                  ));
                            })
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          color: favorited ? Colors.red : null,
                          onPressed: () {
                            setState(() {
                              favorited = !favorited;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(favorited
                                  ? "product addedfrom favorites"
                                  : "product removed  to favorites"),
                              action: SnackBarAction(
                                  label: "Ok",
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                  }),
                            ));
                          },
                          icon: favorited
                              ? const Icon(
                                  CupertinoIcons.heart_fill,
                                )
                              : const Icon(
                                  CupertinoIcons.heart,
                                ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: MaterialButton(
                              padding: const EdgeInsets.all(10),
                              color: Colors.black,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              onPressed: () {
                                const snackBar = SnackBar(
                                  /// need to set following properties for best effect of awesome_snackbar_content
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title:
                                        'Product added to your shopping cart!',
                                    message: 'Check out your shopping cart now',

                                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                    contentType: ContentType.success,
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);
                              },
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Add to cart",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(CupertinoIcons.shopping_cart))
                                ],
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
