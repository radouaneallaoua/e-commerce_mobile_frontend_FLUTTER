
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:e_commerce_app/model/colormodel.dart';
import 'package:e_commerce_app/providers/color_provider.dart';
import 'package:provider/provider.dart';

class SingleColor extends StatefulWidget {
  SingleColor({super.key, required this.color});
  ColorModel color;

  @override
  State<SingleColor> createState() => _SingleColorState();
}

class _SingleColorState extends State<SingleColor> {
  late TextEditingController _colorNameController;
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void initState() {
    _colorNameController = TextEditingController(text: widget.color.color);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        title: Text(
          widget.color.color,
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
                                "are you sure to delete the brand ${widget.color.color} ?"),
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
                                      .read<ColorProvider>()
                                      .deleteColor(widget.color.id);
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
                                  controller: _colorNameController,
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
                                    context.read<ColorProvider>().editColor(
                                        widget.color.id,
                                        _colorNameController.text);
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
