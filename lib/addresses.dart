import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Addresses extends StatefulWidget {
  const Addresses({super.key});

  @override
  State<Addresses> createState() => _AddressesState();
}

class _AddressesState extends State<Addresses> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  TextEditingController? city;
  TextEditingController? email;
  TextEditingController? address;
  TextEditingController? phone;
  TextEditingController? zipcode;
  bool addButtonClicked = false;
  @override
  void initState() {
    city = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    address = TextEditingController();
    zipcode = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    city!.dispose();
    email!.dispose();
    phone!.dispose();
    address!.dispose();
    city!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My address",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      floatingActionButton: addButtonClicked
          ? null
          : Builder(builder: (context) {
              return FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      addButtonClicked = true;
                    });
                    Scaffold.of(context).showBottomSheet(
                      (context) {
                        return Container(
                          width: double.infinity,
                          height: 400,
                          padding: const EdgeInsets.only(
                              right: 20, left: 20,top: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            color:  Color.fromARGB(255,227, 242, 253),
                          ),
                          child: ListView(
                            children: [
                              const Center(
                                  child: Text("Add address",
                                      style: TextStyle(fontSize: 20))),
                              Form(
                                  child: Column(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: TextFormField(
                                      controller: email,
                                      decoration: const InputDecoration(
                                          hintText: "email address",
                                          contentPadding: EdgeInsets.all(20),
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: TextFormField(
                                      controller: phone,
                                      decoration: const InputDecoration(
                                          hintText: "phone number",
                                          contentPadding: EdgeInsets.all(20),
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: TextFormField(
                                      controller: address,
                                      decoration: const InputDecoration(
                                          hintText: "address",
                                          contentPadding: EdgeInsets.all(20),
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: TextFormField(
                                      controller: zipcode,
                                      decoration: const InputDecoration(
                                          hintText: "zip code",
                                          contentPadding: EdgeInsets.all(20),
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: TextFormField(
                                      controller: city,
                                      decoration: const InputDecoration(
                                          hintText: "city",
                                          contentPadding: EdgeInsets.all(20),
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {
                                              addButtonClicked = false;
                                            });
                                          },
                                          child: const Text(
                                            "Cancel",
                                            style: TextStyle(color: Colors.red),
                                          )),
                                      MaterialButton(
                                        padding: const EdgeInsets.all(10),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            addButtonClicked = false;
                                          });
                                        },
                                        child: const Text("Confirm"),
                                        color: Colors.orangeAccent,
                                      )
                                    ],
                                  )
                                ],
                              )),
                            ],
                          ),
                        );
                      },
                    );
                  });
            }),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ...List.generate(
                3,
                (index) => ExpansionTile(
                        tilePadding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        title: Text("address $index"),
                        leading: const Icon(
                          CupertinoIcons.cube_box_fill,
                          color: Colors.orangeAccent,
                          size: 50,
                        ),
                        backgroundColor: Colors.blue[50],
                        expandedAlignment: Alignment.topCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Email",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color.fromARGB(
                                              108, 255, 255, 255)),
                                      child: const Text(
                                          "radouaneallaoua@gmail.com"),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "phone number",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color.fromARGB(
                                              108, 255, 255, 255)),
                                      child: const Text("0637557013"),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "address",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color.fromARGB(
                                              108, 255, 255, 255)),
                                      child: const Text(
                                          "Casablanca street 1 N20 "),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "zip code",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color.fromARGB(
                                              108, 255, 255, 255)),
                                      child: const Text("20000 "),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "city",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color.fromARGB(
                                              108, 255, 255, 255)),
                                      child: const Text("Casablanca "),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ]))
          ],
        ),
      ),
    );
  }
}
