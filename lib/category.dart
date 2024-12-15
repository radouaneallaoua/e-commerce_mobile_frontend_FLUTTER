import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  String categoryImageURL;
  String categoryName;

  Category({
    super.key,
    required this.categoryName,
    required this.categoryImageURL,
  });

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(252, 227, 229, 238)),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10000),
            child: Image.asset(
              widget.categoryImageURL,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.categoryName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.categoryName,
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),

        ],
      ),
    );
  }
}
