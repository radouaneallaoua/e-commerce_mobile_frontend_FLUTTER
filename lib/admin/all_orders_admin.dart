import 'package:e_commerce_app/orderdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AllOrders extends StatefulWidget {
  const AllOrders({super.key});

  @override
  State<AllOrders> createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "orders",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            ...List.generate(
              10,
              (index) => Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Card(
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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: index.isEven
                            ? Colors.orange[300]
                            : index % 3 == 0
                                ? Colors.green[300]
                                : Colors.red[400],
                        borderRadius: BorderRadius.circular(20)),
                    child: index.isEven
                        ? const Text("pending")
                        : index % 3 == 0
                            ? const Text("delivered")
                            : const Text("cancelled"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
