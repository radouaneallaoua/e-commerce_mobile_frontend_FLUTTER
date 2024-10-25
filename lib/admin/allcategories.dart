import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllCategoriesAdmin extends StatefulWidget {
  const AllCategoriesAdmin({super.key});

  @override
  State<AllCategoriesAdmin> createState() => _AllCategoriesAdminState();
}

class _AllCategoriesAdminState extends State<AllCategoriesAdmin> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Categories",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            child: GridView.builder(
              itemCount: 10,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 250,
                  child: Container(
                    child: Card(
                      color: Colors.blue[50],
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1000),
                              child: Image.asset(
                                "assets/fruits.png",
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "category $index",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("category $index"),
                          SizedBox(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: Center(
                                                  child: Text(
                                                      "Delete the category"),
                                                ),
                                                content: Text(
                                                    "Are you sure to delete the category ?"),
                                                contentPadding:
                                                    EdgeInsets.all(15),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        print("cancel");
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        "cancel",
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      )),
                                                  TextButton(
                                                      onPressed: () {
                                                        print("Ok");
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        "Ok",
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      )),
                                                ],
                                              ));
                                    },
                                    icon: Icon(
                                      CupertinoIcons.delete,
                                      color: Colors.red,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )));
  }
}
