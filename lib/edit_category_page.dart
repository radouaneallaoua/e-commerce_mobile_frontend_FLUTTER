import 'dart:io';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/model/categorymodel.dart';

class EditCategoryPage extends StatefulWidget {
  CategoryModel category;
  EditCategoryPage({super.key, required this.category});

  @override
  State<EditCategoryPage> createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  bool picked = false;
  File? file;
  String? _parentCategoryName;

  final List<SelectedListItem> _categoryList = [
    SelectedListItem(
      name: "Category1",
      value: "TYO",
    ),
    SelectedListItem(
      name: "Category2",
      value: "NY",
    ),
    SelectedListItem(
      name: "Category3",
      value: "LDN",
    ),
    SelectedListItem(
      name: "Category4",
      value: "Test",
    ),
    SelectedListItem(
      name: "Category5",
      value: "Tset2",
    ),
  ];

  @override
  void initState() {
    _descriptionController =
        TextEditingController(text: widget.category.description);
    _nameController = TextEditingController(text: widget.category.name);

    super.initState();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      File file2 = File(result.files.single.path!);

      file = file2;
      picked = true;
      setState(() {});
    } else {
      if (file == null) {
        picked = false;
      }
    }
  }

  void _onTap() {
    DropDownState(
      DropDown(
        maxSelectedItems: 1,
        searchFillColor: Colors.blue[50],
        bottomSheetTitle: const Text(
          "parent category",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: _categoryList,
        onSelected: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          setState(() {
            _parentCategoryName =
                list.toString().substring(1, list.toString().length - 1);
          });
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("edit category"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(CupertinoIcons.back)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Form(
                key: _formState,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Category name can not be empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "name",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _descriptionController,
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
                    GestureDetector(
                      onTap: _onTap,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: widget.category.parentCategoryId == null
                              ? const Text("Parent category")
                              : Text(
                                  _parentCategoryName!,
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 200,
                      child: !picked
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'http://10.0.2.2:8081/categories/${widget.category.id}/image',
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'http://10.0.2.2:8081/categories/${widget.category.id}/image',
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Text(
                                    "the old image",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    file != null
                        ? Stack(
                            children: [
                              Visibility(
                                  visible: picked,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      file!,
                                      width: double.infinity,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Text(
                                      "the new image",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  IconButton.filled(
                                      onPressed: () {
                                        setState(() {
                                          file = null;
                                          picked = false;
                                        });
                                      },
                                      icon: const Icon(Icons.cancel))
                                ],
                              )
                            ],
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                        padding: const EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: const Color.fromARGB(255, 21, 26, 98),
                        onPressed: () {
                          _pick();
                        },
                        child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.file_upload,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Change category image",
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
                          print(_formState.currentState!.validate());
                        },
                        child: const Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Edit category",
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
