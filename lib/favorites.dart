import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List items = List<int>.generate(20, (index) => index);
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
          child: ListView.builder(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      trailing: const Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Icon(
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
                        child: Text(
                          "Add to shopping cart",
                          style: TextStyle(color: Colors.white),
                        ),
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
                          behavior: SnackBarBehavior.floating,
                          content: const Text("Product removed from favorites"),
                          action: SnackBarAction(
                              label: "Ok",
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              }),
                        ),
                      );
                    } else if (direction == DismissDirection.startToEnd) {
                      const snackBar = SnackBar(
                        /// need to set following properties for best effect of awesome_snackbar_content
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Product added to your shopping cart!',
                          message: 'Check out your shopping cart now',

                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                          contentType: ContentType.success,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
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
                ).animate().fadeIn(duration: const Duration(milliseconds: 900));
              }),
        ));
  }
}
