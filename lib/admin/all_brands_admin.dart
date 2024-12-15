
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/admin/single_brand.dart';
import 'package:e_commerce_app/model/brandmodel.dart';
import 'package:e_commerce_app/providers/brand_provider.dart';
import 'package:provider/provider.dart';

class AllBrands extends StatefulWidget {
  const AllBrands({super.key});

  @override
  State<AllBrands> createState() => _AllBrandsState();
}

class _AllBrandsState extends State<AllBrands> {
  bool isVisible = true;
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  late TextEditingController _brandNameController;

  @override
  void initState() {
    _brandNameController = TextEditingController(text: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Brands",
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
                              "Brand name",
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
                                          return "brand name can not be empty";
                                        }
                                        return null;
                                      },
                                      controller: _brandNameController,
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
                                                .read<BrandProvider>()
                                                .addBrand(
                                                    _brandNameController.text);
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
                                                  "add brand",
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
            child: FutureBuilder<List<BrandModel>>(
              future: context.read<BrandProvider>().getBrands(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return SingleBrand(brand: snapshot.data![index]);
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
