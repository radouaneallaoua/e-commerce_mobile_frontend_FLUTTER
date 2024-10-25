import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order details"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Center(
              child: Text(
                "Order #12344",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Sum  \$200",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Placed on Jun 11 2024",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Products List",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
             const SizedBox(
              height: 10,
            ),
            ...List.generate(
                10,
                (index) =>  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("8 item",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        Text("sum product \$100",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                      ],
                    ),
                    Card(
                          child: ListTile(
                            leading: Image.asset(
                                "assets/intro3.png",
                                width: 80,
                                height: 80,
                                
                              
                            ),
                            title: Text("Product $index"),
                            subtitle: Text("product $index description"),
                            trailing: const Text("price \$20"),
                          ),
                        ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
