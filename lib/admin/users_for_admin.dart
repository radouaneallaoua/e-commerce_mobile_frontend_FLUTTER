import 'package:flutter/material.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({super.key});

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.fitHeight,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  title: Text(
                    "user$index",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("user$index@gmail.com"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.green,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
