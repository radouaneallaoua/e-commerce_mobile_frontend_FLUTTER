import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ShoppingCartItem extends StatefulWidget {
  const ShoppingCartItem({super.key});

  @override
  State<ShoppingCartItem> createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  int _count = 1;
  final double _price = 20;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Image.asset("assets/prices.png"),
          title: const Text(
            "ProductName 1",
            style: TextStyle(overflow: TextOverflow.ellipsis),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                "\$${_price * _count}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.red[100],
                    ),
                    child: IconButton(
                        onPressed: () {
                          if (_count > 1) {
                            setState(() {
                              _count--;
                            });
                          }
                        },
                        icon: const Icon(Icons.remove)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "$_count",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue[100],
                    ),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            _count++;
                          });
                        },
                        icon: const Icon(Icons.add)),
                  ),
                ],
              )
            ],
          ),
          trailing: IconButton(
            icon: const Icon(CupertinoIcons.delete, color: Colors.red),
            onPressed: () {},
          )),
    ).animate().shimmer(color: Colors.black12);
  }
}
