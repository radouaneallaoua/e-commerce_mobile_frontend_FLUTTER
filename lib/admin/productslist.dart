import 'package:e_commerce_app/admin/add_product_admin.dart';
import 'package:e_commerce_app/admin/edit_product.dart';
import 'package:e_commerce_app/model/productmodel.dart';
import 'package:e_commerce_app/product-details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsListAdmin extends StatefulWidget {
  const ProductsListAdmin({super.key});

  @override
  State<ProductsListAdmin> createState() => _ProductsListAdminState();
}

class _ProductsListAdminState extends State<ProductsListAdmin> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("products"),
      ),
      floatingActionButton: Visibility(
        visible: isVisible,
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => const AddProductPage()));
          },
          child: const Icon(
            CupertinoIcons.add,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Scrollbar(
              thickness: 10,
              interactive: true,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Stack(
                        children: [
                          Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              horizontalTitleGap: 10,
                              isThreeLine: true,
                              contentPadding: const EdgeInsets.all(10),
                              tileColor: Colors.blue[50],
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.asset(
                                  "assets/fruits.png",
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text("product $index"),
                              subtitle: Text(
                                "description product $index",
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: PopupMenuButton(
                                color: Colors.white,
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: const Text(
                                                      "delete product"),
                                                  content: const Text(
                                                      "Are you sure to delete the product?"),
                                                  contentPadding:
                                                      const EdgeInsets.all(20),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                            "cancel")),
                                                    FilledButton(
                                                        style: const ButtonStyle(
                                                            backgroundColor:
                                                                WidgetStatePropertyAll(
                                                                    Colors
                                                                        .red)),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                            "confirm"))
                                                  ],
                                                ));
                                      },
                                      child: const Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.delete,
                                            color: Colors.red,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("delete")
                                        ],
                                      )),
                                  PopupMenuItem(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    const EditProductPage()));
                                      },
                                      child: const Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.pencil,
                                            color: Colors.blue,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Edit")
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.green[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: const Text("100 in stack"),
                          )
                        ],
                      )),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.cancel_outlined)),
      IconButton(
          onPressed: () {
            print("show botom sheet");
          },
          icon: const Icon(Icons.filter_alt_outlined))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(CupertinoIcons.back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView(children: const [Text("hello")]);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => Card(
              child: ListTile(
                horizontalTitleGap: 10,
                isThreeLine: true,
                contentPadding: const EdgeInsets.all(10),
                tileColor: Colors.blue[50],
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child:
                      Image.asset("assets/fruits.png", width: 60, height: 60),
                ),
                title: Text("product $index"),
                subtitle: Text(
                  "description product $index",
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        onTap: () {
                          print("delete product $index");
                        },
                        child: const Row(
                          children: [
                            Icon(
                              CupertinoIcons.delete,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("delete")
                          ],
                        )),
                    PopupMenuItem(
                        onTap: () {
                          showBottomSheet(
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: 300,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ListView(
                                      children: [
                                        const TextField(),
                                        const TextField(),
                                        const TextField(),
                                        const TextField(),
                                        const TextField(),
                                        const TextField(),
                                        const TextField(),
                                        const TextField(),
                                        IconButton(
                                            onPressed: () {
                                              print("edit");
                                            },
                                            icon: const Icon(Icons.edit))
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: const Row(
                          children: [
                            Icon(
                              CupertinoIcons.pencil,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Edit")
                          ],
                        )),
                  ],
                ),
              ),
            ));
  }
}

class ProductDetailsAdmin extends StatelessWidget {
  const ProductDetailsAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ProductDetailes(
        productModel: ProductModel(
            oldPrice: 80,
            price: 100,
            productDescription: "des",
            productId: 1,
            productImageURL: "assets/fruits.png",
            productName: "Product 1"),
      ),
    );
  }
}
