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
                          height: 500,
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, top: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            color: Colors.white,
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
                                      decoration: InputDecoration(
                                          hintText: "email address",
                                          contentPadding:
                                              const EdgeInsets.all(20),
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.blue[50],
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
                                      decoration: InputDecoration(
                                          hintText: "phone number",
                                          contentPadding:
                                              const EdgeInsets.all(20),
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.blue[50],
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
                                      decoration: InputDecoration(
                                          hintText: "address",
                                          contentPadding:
                                              const EdgeInsets.all(20),
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.blue[50],
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
                                      decoration: InputDecoration(
                                          hintText: "zip code",
                                          contentPadding:
                                              const EdgeInsets.all(20),
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.blue[50],
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
                                      decoration: InputDecoration(
                                          hintText: "city",
                                          contentPadding:
                                              const EdgeInsets.all(20),
                                          hintStyle: const TextStyle(
                                              color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.blue[50],
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
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
                                        minWidth:
                                            MediaQuery.of(context).size.width *
                                                60 /
                                                100,
                                        padding: const EdgeInsets.all(20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            addButtonClicked = false;
                                          });
                                        },
                                        color: Colors.orangeAccent,
                                        child: const Text("Confirm"),
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
                10,
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
                                          color: Colors.white),
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
                                          color: Colors.white),
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
                                          color: Colors.white),
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
                                          color: Colors.white),
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
                                          color: Colors.white),
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
