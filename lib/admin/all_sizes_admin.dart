import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/admin/single_size.dart';
import 'package:e_commerce_app/providers/size_provider.dart';
import 'package:provider/provider.dart';

class SizesPage extends StatefulWidget {
  const SizesPage({super.key});

  @override
  State<SizesPage> createState() => _SizesPageState();
}

class _SizesPageState extends State<SizesPage> {
  bool isVisible = true;
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  late TextEditingController _sizeNameController;
  @override
  void initState() {
    super.initState();
    _sizeNameController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "product sizes",
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
                              "Size label",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Form(
                                key: _formState,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.trim() == "") {
                                      return "size label can not be empty";
                                    }
                                    return null;
                                  },
                                  controller: _sizeNameController,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                                padding: const EdgeInsets.all(5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: Colors.blue[300],
                                onPressed: () {
                                  if (_formState.currentState!.validate()) {
                                    context
                                        .read<SizeProvider>()
                                        .addSize(_sizeNameController.text);
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
                                          "add size",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ))),
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
            child: FutureBuilder(
                future: context.read<SizeProvider>().getSizes(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return SingleSize(size: snapshot.data![index]);
                      },
                    );
                  }
                  if (snapshot.hasError) {
                    throw "error";
                  }
                  return const Center(child: CircularProgressIndicator());
                })));
  }
}
