
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/model/brandmodel.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:e_commerce_app/providers/brand_provider.dart';
import 'package:provider/provider.dart';

class SingleBrand extends StatefulWidget {
  SingleBrand({super.key, required this.brand});
  BrandModel brand;

  @override
  State<SingleBrand> createState() => _SingleBrandState();
}

class _SingleBrandState extends State<SingleBrand> {
  late TextEditingController _brandNameController;
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void initState() {
    _brandNameController = TextEditingController(text: widget.brand.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        title: Text(
          widget.brand.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text("delete brand"),
                            content: Text(
                                "are you sure to delete the brand ${widget.brand.name} ?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("cancel")),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.red,
                                onPressed: () {
                                  context
                                      .read<BrandProvider>()
                                      .deleteBrand(widget.brand.id);
                                  Navigator.of(context).pop();
                                },
                                child: const Text("delete"),
                              )
                            ],
                          ));
                },
                icon: const Icon(
                  CupertinoIcons.delete,
                  color: Colors.red,
                )),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text("edit brand"),
                            content: Form(
                                key: _formKey,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.trim() == "") {
                                      return "brand name can not be empty";
                                    }
                                    return null;
                                  },
                                  controller: _brandNameController,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder()),
                                )),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("cancel")),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.green,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<BrandProvider>().editBrand(
                                        widget.brand.id,
                                        _brandNameController.text);
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: const Text(
                                  "edit",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ).animate().fadeIn());
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                ))
          ],
        ),
      ),
    );
  }
}
