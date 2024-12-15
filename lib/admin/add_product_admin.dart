import 'dart:io';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  bool picked = false;
  File? file;
  String? _categoryName;
  String? _brand;
  List<String>? _colors;
  List<String>? _sizes;
  int? _searchIndexItem;

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController description;

  final List<dynamic> _searchItemsGroup = [
    {
      "title": "Select category",
      "options": List.generate(
        5,
        (index) => SelectedListItem(
          name: "Category$index",
          value: "Category$index",
        ),
      ),
      "target": "category"
    },
    {
      "title": "Select brand",
      "options": List.generate(
        5,
        (index) => SelectedListItem(
          name: "Brand$index",
          value: "Brand$index",
        ),
      ),
      "target": "brand"
    },
    {
      "title": "Select colors",
      "options": List.generate(
        5,
        (index) => SelectedListItem(
          name: "Color$index",
          value: "Color$index",
        ),
      ),
      "target": "colors"
    },
    {
      "title": "Select sizes",
      "options": List.generate(
        5,
        (index) => SelectedListItem(
          name: "Size$index",
          value: "Size$index",
        ),
      ),
      "target": "brand"
    },
  ];
  @override
  void initState() {
    description = TextEditingController(text: "");
    name = TextEditingController(text: "");

    super.initState();
  }

  @override
  void dispose() {
    description.dispose();
    name.dispose();
    super.dispose();
  }

  Future<void> _pick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      File file2 = File(result.files.single.path!);
      picked = true;
      file = file2;
    } else {
      if (file == null) {
        picked = false;
      }
    }
  }

  void _onTap() {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          _searchItemsGroup[_searchIndexItem!]["title"],
          style: const TextStyle(
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
        data: _searchItemsGroup[_searchIndexItem!]["options"],
        onSelected: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
            }
          }
          setState(() {
            if (_searchItemsGroup[_searchIndexItem!]["target"] == "category") {
              _categoryName = list.toString();
              print(_categoryName);
            } else if (_searchItemsGroup[_searchIndexItem!]["target"] ==
                "brand") {
              _brand = list.toString();
            } else if (_searchItemsGroup[_searchIndexItem!]["target"] ==
                "colors") {
              _colors = list;
            } else if (_searchItemsGroup[_searchIndexItem!]["target"] ==
                "sizes") {
              _sizes = list;
            }
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
        title: const Text("add product"),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(CupertinoIcons.back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
            key: _formState,
            child: ListView(
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
                      labelText: "price",
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _searchIndexItem = 0;
                    });
                    _onTap();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        color: _categoryName == null ? null : Colors.blue[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: _categoryName == null
                          ? const Text(
                              "choose product's category",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          : Text(
                              _categoryName!,
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _searchIndexItem = 1;
                    });
                    _onTap();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        color: _brand == null ? null : Colors.blue[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: _brand == null
                          ? const Text(
                              "choose product's brand",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          : Text(
                              _brand!,
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _searchIndexItem = 2;
                    });
                    _onTap();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        color: _colors == null ? null : Colors.blue[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: _colors == null
                          ? const Text("colors")
                          : Text(
                              _colors.toString(),
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _searchIndexItem = 3;
                    });
                    _onTap();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        color: _sizes == null ? null : Colors.blue[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: _sizes == null
                          ? const Text("sizes")
                          : Text(
                              _sizes.toString(),
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
                              "Pick category image",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
                              "add category",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ))),
              ],
            )),
      ),
    );
  }
}
