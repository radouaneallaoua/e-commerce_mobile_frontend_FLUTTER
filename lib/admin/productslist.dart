import 'package:chat_app/model/productmodel.dart';
import 'package:chat_app/product-details.dart';
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
          title: Text("products"),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: Icon(Icons.search))
          ],
        ),
        floatingActionButton: Visibility(
          visible: isVisible,
          child: FloatingActionButton(
             backgroundColor: Colors.blue,
            onPressed: () {
              print("add product");
            },
            child: const Icon(
              CupertinoIcons.add,
              color: Colors.white,
            ),
          ),
        ),
        
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDetailsAdmin()));
                    },
                    child: Card(
                      child: ListTile(
                        horizontalTitleGap: 10,
                        isThreeLine: true,
                        contentPadding: const EdgeInsets.all(10),
                        tileColor: Colors.blue[50],
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Image.asset("assets/fruits.png",
                              width: 60, height: 60,fit: BoxFit.cover,),
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
                                  setState(() {
                                    isVisible = false;
                                  });
                                  showBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return SizedBox(
                                          height: 300,
                                          width: double.infinity,
                                          child: Padding(
                                            padding: EdgeInsets.all(15),
                                            child: ListView(
                                              children: [
                                                Text("New Name"),
                                                TextField(),
                                                Text("New Name"),
                                                TextField(),
                                                Text("New Name"),
                                                TextField(),
                                                Text("New Name"),
                                                TextField(),
                                                Text("New Name"),
                                                TextField(),
                                                TextField(),
                                                SizedBox(height: 10,),
                                                MaterialButton(
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                  animationDuration:  Duration(milliseconds: 500),
                                                  color: Colors.blue,
                                                    onPressed: () {
                                                      print("edit");
                                                    },
                                                    child: Text("edit",style: TextStyle(color: Colors.white),))
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
                    ),
                  )),
        ));
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
          icon: Icon(Icons.cancel_outlined)),
      IconButton(
          onPressed: () {
            print("show botom sheet");
          },
          icon: Icon(Icons.filter_alt_outlined))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(CupertinoIcons.back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView(children: [Text("hello")]);
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
                                    padding: EdgeInsets.all(10),
                                    child: ListView(
                                      children: [
                                        TextField(),
                                        TextField(),
                                        TextField(),
                                        TextField(),
                                        TextField(),
                                        TextField(),
                                        TextField(),
                                        TextField(),
                                        IconButton(
                                            onPressed: () {
                                              print("edit");
                                            },
                                            icon: Icon(Icons.edit))
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
    return Container(child: 
    ProductDetailes(productModel: ProductModel(oldPrice: 80,price: 100,productDescription: "des",productId: 1,productImageURL: "assets/fruits.png",productName: "Product 1"),),);
  }
}