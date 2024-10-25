import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCartItem extends StatefulWidget {
  const ShoppingCartItem({super.key});

  @override
  State<ShoppingCartItem> createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  int _count = 1;
  double _price = 20;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Image.asset("assets/prices.png"),
          title: Text(
            "ProductName 1",
            style: TextStyle(overflow: TextOverflow.ellipsis),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                "\$${_price * _count}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
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
                        icon: Icon(Icons.remove)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "$_count",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
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
                        icon: Icon(Icons.add)),
                  ),
                ],
              )
            ],
          ),
          trailing: IconButton(
            icon: Icon(CupertinoIcons.delete, color: Colors.red),
            onPressed: () {},
          )),
    );
  }
}
