import 'package:e_commerce_app/providers/category_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/add_category_page.dart';
import 'package:e_commerce_app/admin/single_category.dart';
import 'package:e_commerce_app/model/categorymodel.dart';

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
          title: const Text(
            "Categories",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: Visibility(
          visible: isVisible,
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => const AddCategoryPage()));
            },
            child: const Icon(
              CupertinoIcons.add,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            child: FutureBuilder<List<CategoryModel>>(
              future: context.read<CategoryProvider>().getCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return SingleCategory(category: snapshot.data![index]);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              },
            )));
  }
}
