import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List items = List<int>.generate(20, (index) => index);
  late GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  // List<String> item = List<String>.generate(20, (index) => "item $index");
  // void _insertItem(String ite) {
  //   item.insert(0, ite);
  //   _key.currentState!
  //       .insertItem(0, duration: const Duration(milliseconds: 800));
  // }

  // @override
  // void initState() {
  //   for (var i = 0; i < item.length; i++) {
  //     _insertItem(item[i]);
  //   }
  //   super.initState();
  // }

  // void _removeItem(int index) {
  //   _key.currentState!.removeItem(index, (context, animation) {
  //     return SizeTransition(
  //       sizeFactor: animation,
  //       child: const Card(
  //         color: Colors.red,
  //         child: ListTile(
  //           title: Text("deleted"),
  //         ),
  //       ),
  //     );
  //   });
  //   item.removeAt(index);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        body: Padding(
          padding: const EdgeInsets.all(10),
          child:
              // AnimatedList(
              //   key: UniqueKey(),
              //   itemBuilder: (context, index, animation) {
              //     return SizeTransition(
              //       sizeFactor: animation,
              //       child: Card(
              //         child: ListTile(
              //           leading: ClipRRect(
              //             borderRadius: BorderRadius.circular(200),
              //             child: Image.asset(
              //               "assets/fruits.png",
              //               width: 80,
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //           title: const Text("product 1"),
              //           subtitle: const Row(
              //             children: [
              //               Text("price: \$20"),
              //               SizedBox(
              //                 width: 10,
              //               ),
              //               Text("category: Fruits")
              //             ],
              //           ),
              //           trailing: IconButton(
              //             icon: const Icon(
              //               CupertinoIcons.delete,
              //               color: Colors.red,
              //             ),
              //             onPressed: () {
              //               _removeItem(index);
              //             },
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // )
              ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      secondaryBackground: Card(
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          tileColor: Colors.red,
                          title: const Padding(
                            padding: EdgeInsets.only(top: 30.0),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Delete",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          trailing: const Padding(
                            padding: EdgeInsets.only(top: 30.0),
                            child: 
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              
                            
                          ),
                        ),
                      ),
                      background: Card(
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          tileColor: Colors.green,
                          title: const Padding(
                             padding: EdgeInsets.only(top: 30.0),
                            child: Text("Add to shopping cart",style: TextStyle(color: Colors.white),),
                          ),
                          leading: const Padding(
                            padding: EdgeInsets.only(top: 30.0),
                            child: Icon(
                              Icons.shopping_cart_checkout_rounded,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                      key: ValueKey<int>(items[index]),
                      onDismissed: (DismissDirection direction) {
                        if (direction == DismissDirection.endToStart) {
                          setState(() {
                            items.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text("Product removed from favorites"),
                              action: SnackBarAction(
                                  label: "Ok",
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                  }),
                            ),
                          );
                        } else if (direction == DismissDirection.startToEnd) {
                          ScaffoldMessenger.of(context).showMaterialBanner(
                              MaterialBanner(
                                backgroundColor: Colors.blueGrey.withOpacity(0.7),
                                leading: const Icon(Icons.notification_add_outlined),
                                  content:
                                      const Text("Product added to shopping cart"),
                                  actions: [
                                TextButton(
                                  child: const Text("Ok"),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentMaterialBanner();
                                  },
                                )
                              ]));
                        }
                      },
                      direction: DismissDirection.horizontal,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            trailing: const Icon(
                              CupertinoIcons.heart_fill,
                              color: Colors.red,
                            ),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/fruits.png",
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: const Text("product 1"),
                            subtitle: const Row(
                              children: [
                                Text("price: \$20"),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("category: Fruits")
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
        ));
  }
}
