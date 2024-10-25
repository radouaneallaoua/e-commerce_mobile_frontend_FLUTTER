import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  File? file;
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  TextEditingController? username;
  TextEditingController? email;
  TextEditingController? address;
  TextEditingController? phone;
  TextEditingController? password;
  @override
  void initState() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    address = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    username!.dispose();
    email!.dispose();
    phone!.dispose();
    address!.dispose();
    password!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text(
          "about me",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Personal Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.asset(
                        "assets/intro3.png",
                        width: 120,
                        height: 120,
                      ),
                    ),
                    IconButton.filled(
                      tooltip: "Edit photo",
                      highlightColor: Colors.white,
                      color: Color.fromARGB(179, 55, 71, 163),
                      icon: const Icon(
                        Icons.edit,
                        color: Color.fromRGBO(255, 255, 255, 1),
                        size: 30,
                      ),
                      onPressed: () {
                        print("open files");
                      },
                    )
                  ],
                )
              ],
            ),
            Form(
                child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: TextField(
                    controller: phone,
                    decoration: const InputDecoration(
                        hintText: "username",
                        prefixIcon: Icon(CupertinoIcons.person),
                        hintStyle: TextStyle(color: Colors.grey),
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
                  child: TextField(
                    controller: phone,
                    decoration: const InputDecoration(
                        hintText: "phone number",
                        prefixIcon: Icon(CupertinoIcons.phone),
                        hintStyle: TextStyle(color: Colors.grey),
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
                  child: TextField(
                    controller: phone,
                    decoration: const InputDecoration(
                        hintText: "email",
                        prefixIcon: Icon(CupertinoIcons.mail),
                        hintStyle: TextStyle(color: Colors.grey),
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
                  child: TextField(
                    controller: phone,
                    decoration: const InputDecoration(
                        hintText: "address",
                        prefixIcon: Icon(CupertinoIcons.location),
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Change Password",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: TextField(
                    controller: phone,
                    decoration: const InputDecoration(
                        hintText: "new password",
                        prefixIcon: Icon(CupertinoIcons.lock),
                        hintStyle: TextStyle(color: Colors.grey),
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
                  child: TextField(
                    controller: phone,
                    decoration: const InputDecoration(
                        hintText: "confirm new password",
                        prefixIcon: Icon(CupertinoIcons.lock),
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none),
                  ),
                ),
              ],
            )),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
                color: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: const Text(
                  "save settings",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                padding: const EdgeInsets.all(15),
                onPressed: () {
                  print("updated");
                })
          ],
        ),
      ),
    );
  }
}
