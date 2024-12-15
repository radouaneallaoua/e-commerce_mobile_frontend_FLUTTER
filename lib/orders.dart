import 'package:e_commerce_app/orderdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My orders",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ...List.generate(
              10,
              (index) => Card(
                child: ListTile(
                    leading: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Icon(
                        CupertinoIcons.cube_box_fill,
                        color: Colors.orangeAccent,
                        size: 50,
                      ),
                    ),
                    title: Text(
                      "Order $index",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Placed on Jun 11 2024"),
                        Text(
                            "items: ${index + 5}   total price: \$${index + 200}"),
                      ],
                    ),
                    isThreeLine: true,
                    trailing: TextButton(
                      child: const Text("Details"),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const OrderDetails()));
                      },
                    )),
              ).animate().shimmer(color: Colors.black38),
            )
          ],
        ),
      ),
    );
  }
}
