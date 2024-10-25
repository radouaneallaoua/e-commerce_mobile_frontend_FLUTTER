import 'package:flutter/material.dart';

class AdminDrawerItem extends StatefulWidget {
  const AdminDrawerItem({super.key});

  @override
  State<AdminDrawerItem> createState() => _AdminDrawerItemState();
}

class _AdminDrawerItemState extends State<AdminDrawerItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                            onTap: () {
                              setState(() {
                                index = 0;
                              });
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 700),
                                  curve: Curves.fastOutSlowIn,
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      color: index == 0
                                          ? const Color.fromARGB(151, 7, 118, 209)
                                          : Colors.white,
                                      borderRadius: index == 0
                                          ? const BorderRadius.only(
                                              topRight: Radius.circular(30),
                                              bottomRight: Radius.circular(30))
                                          : BorderRadius.circular(0)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.settings,
                                        color: (index == 0)
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Products",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: index == 0
                                                ? Colors.white
                                                : Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ));
  }
}