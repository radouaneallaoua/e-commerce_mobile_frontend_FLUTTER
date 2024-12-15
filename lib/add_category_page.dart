import 'dart:io';
import 'package:e_commerce_app/model/categorymodel.dart';
import 'package:e_commerce_app/providers/category_provider.dart';
import 'package:provider/provider.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  bool picked = false;
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  late TextEditingController _categoryNameController;
  late TextEditingController _categoryDescriptionController;
  File? file;
  int? _parentCategoryId;

  @override
  void initState() {
    _categoryNameController = TextEditingController(text: "");
    _categoryDescriptionController = TextEditingController(text: "");

    super.initState();
  }

  @override
  void dispose() {
    _categoryNameController.dispose();
    _categoryDescriptionController.dispose();
    super.dispose();
  }

  Future<void> _pick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      File file2 = File(result.files.single.path!);
      setState(() {
        picked = true;
        file = file2;
      });
    } else {
      if (file == null) {
        picked = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("add category"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(CupertinoIcons.back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Form(
                key: _formState,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Category name can not be empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "name",
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Category description can not be empty";
                        }
                        return null;
                      },
                      maxLines: 3,
                      minLines: 1,
                      decoration: InputDecoration(
                          labelText: "description",
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    picked
                        ? Image.file(
                            file!,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                        padding: const EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: const Color.fromARGB(255, 21, 26, 98),
                        onPressed: () {
                          _pick();
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.file_upload,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                picked
                                    ? const Text(
                                        "Change category image",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      )
                                    : const Text(
                                        "Pick category image",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                              ],
                            ))),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                        padding: const EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.blue[300],
                        onPressed: () {
                          if (_formState.currentState!.validate() &&
                              file != null) {
                            context.read<CategoryProvider>().addCategory(
                                categoryName: _categoryNameController.text,
                                description:
                                    _categoryDescriptionController.text,
                                image: file!,
                                parentCategoryId: _parentCategoryId);
                            print("hello");
                          }
                        },
                        child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "add category",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ))),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
