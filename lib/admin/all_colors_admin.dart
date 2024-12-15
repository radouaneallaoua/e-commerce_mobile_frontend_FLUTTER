
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/admin/single_color.dart';
import 'package:e_commerce_app/model/colormodel.dart';
import 'package:e_commerce_app/providers/color_provider.dart';
import 'package:provider/provider.dart';

class AllColors extends StatefulWidget {
  const AllColors({super.key});

  @override
  State<AllColors> createState() => _AllColorsState();
}

class _AllColorsState extends State<AllColors> {
  bool isVisible = true;
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  late TextEditingController _colorNameController;

  @override
  void initState() {
    _colorNameController = TextEditingController(text: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Colors",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: Visibility(
          visible: isVisible,
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 400,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Color name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Form(
                                key: _formState,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      validator: (value) {
                                        if (value!.trim() == "") {
                                          return "color name can not be empty";
                                        }
                                        return null;
                                      },
                                      controller: _colorNameController,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    MaterialButton(
                                        padding: const EdgeInsets.all(5),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        color: Colors.blue[300],
                                        onPressed: () {
                                          if (_formState.currentState!
                                              .validate()) {
                                            context
                                                .read<ColorProvider>()
                                                .addColor(
                                                    _colorNameController.text);
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: const Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "add color",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ))),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: const Icon(
              CupertinoIcons.add,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            child: FutureBuilder<List<ColorModel>>(
              future: context.read<ColorProvider>().getColors(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return SingleColor(color: snapshot.data![index]);
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
