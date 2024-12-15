
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/edit_category_page.dart';
import 'package:e_commerce_app/model/categorymodel.dart';

import 'package:e_commerce_app/providers/category_provider.dart';
import 'package:provider/provider.dart';

class SingleCategory extends StatefulWidget {
  SingleCategory({super.key, required this.category});
  CategoryModel category;

  @override
  State<SingleCategory> createState() => _SingleCategoryState();
}

class _SingleCategoryState extends State<SingleCategory> {
  late TextEditingController _categoryNameController;
  @override
  void initState() {
    _categoryNameController = TextEditingController(text: widget.category.name);
    super.initState();
  }

  @override
  void dispose() {
    _categoryNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Card(
        color: const Color.fromARGB(255, 227, 242, 253),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.network(
                  'http://10.0.2.2:8081/categories/${widget.category.id}/image',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.category.name,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(widget.category.description),
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        _showDeleteCategoryDialog(context);
                      },
                      icon: const Icon(
                        CupertinoIcons.delete,
                        color: Colors.red,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => EditCategoryPage(
                                  category: widget.category,
                                )));
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDeleteCategoryDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Center(
                child: Text("Delete the category"),
              ),
              content: const Text("Are you sure to delete the category ?"),
              contentPadding: const EdgeInsets.all(15),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "cancel",
                      style: TextStyle(color: Colors.blue),
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: () {
                      context
                          .read<CategoryProvider>()
                          .deleteCategory(widget.category.id);
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Delete",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ));
  }
}
